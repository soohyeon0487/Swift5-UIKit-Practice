//
//  ViewController.swift
//  Chapter02-inputForm
//
//  Created by Soohyeon Lee on 2021/01/09.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "설정"
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        //self.paramEmail.adjustsFontSizeToFitWidth = true
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.textAlignment = NSTextAlignment.center
        self.paramEmail.placeholder = "이메일 아무거나"
        self.paramEmail.autocapitalizationType = .none
        
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = .red
        self.txtUpdate.text = "갱신함"
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = .red
        self.txtInterval.text = "0분마다"
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        
        self.view.addSubview(lblEmail)
        self.view.addSubview(self.paramEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(self.paramUpdate)
        self.view.addSubview(self.txtUpdate)
        self.view.addSubview(lblInterval)
        self.view.addSubview(self.paramInterval)
        self.view.addSubview(self.txtInterval)
        self.navigationItem.rightBarButtonItem = submitBtn
        
        self.paramUpdate.addTarget(self, action: #selector(self.presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(self.presnetIntervalValue(_:)), for: .valueChanged)
    }

    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = sender.isOn ? "갱신함" : "갱신하지 않음"
    }
    
    @objc func presnetIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = "\(Int(sender.value))분마다"
    }
    
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }

}

