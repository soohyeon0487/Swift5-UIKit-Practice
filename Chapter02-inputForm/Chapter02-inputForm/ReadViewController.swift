//
//  ReadViewController.swift
//  Chapter02-inputForm
//
//  Created by Soohyeon Lee on 2021/01/09.
//

import UIKit

class ReadViewController: UIViewController {

    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let email = UILabel()
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        email.text = "전달 받은 정보 : \(self.pEmail!)"
        
        let update = UILabel()
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        update.text = "전달 받은 정보 : \(self.pUpdate! ? "업데이터 함" : "업데이트 안함")"
        
        let interval = UILabel()
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        interval.text = "전달 받은 정보 : \(self.pInterval!)"
        
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
    }
    

}
