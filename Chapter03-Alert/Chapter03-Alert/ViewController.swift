//
//  ViewController.swift
//  Chapter03-Alert
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width/2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertBtn)
    }
    
    @objc func defaultAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel action")
        }
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        let v = UIViewController()
        v.view.backgroundColor = .red
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    

}

