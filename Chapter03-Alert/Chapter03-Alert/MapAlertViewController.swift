//
//  MapAlertViewController.swift
//  Chapter03-Alert
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width/2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertBtn)
        
    }
    
    @objc func mapAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        let contentVC = MapKitViewController()
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @objc func listAlert(_ sender: Any) {
        
        let contentVC = ListViewController()
        contentVC.delegate = self
        
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    func didSelectedRowAt(indexPath: IndexPath) {
        print(">>>> 선택된 행 : \(indexPath.row)")
    }
    
}
