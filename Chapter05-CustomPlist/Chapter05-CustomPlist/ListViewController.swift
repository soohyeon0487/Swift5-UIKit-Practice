//
//  ListViewController.swift
//  Chapter05-CustomPlist
//
//  Created by Soohyeon Lee on 2021/01/13.
//

import UIKit

class ListViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var accountList = [String]()
    
    var selectingAccount = ""
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        
        let value = sender.selectedSegmentIndex
        
//        let plist = UserDefaults.standard
//        plist.setValue(value, forKey: "gender")
//        plist.synchronize()
        
        let customPlist = "\(self.account.text!).plist"
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let path = paths[0] as NSString
        let plist = path.strings(byAppendingPaths: [customPlist]).first!
        let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
    
        data.setValue(value, forKey: "gender")
        data.write(toFile: plist, atomically: true)
        
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        
        let value = sender.isOn
        
//        let plist = UserDefaults.standard
//        plist.setValue(value, forKey: "married")
//        plist.synchronize()
        
        let customPlist = "\(self.account.text!).plist"
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let path = paths[0] as NSString
        let plist = path.strings(byAppendingPaths: [customPlist]).first!
        let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
    
        data.setValue(value, forKey: "married")
        data.write(toFile: plist, atomically: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(#file.split(separator: "/").last!)
        
        //print(#function)
        
        //print(#line)
        
        //        let plist = UserDefaults.standard
        //
        //        self.name.text = plist.string(forKey: "name")
        //        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        //        self.married.isOn = plist.bool(forKey: "married")
        
        let picker = UIPickerView()
        
        picker.delegate = self
        
        self.account.inputView = picker
        
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: 0, height: 45)
        toolBar.tintColor = .lightGray
        
        self.account.inputAccessoryView = toolBar
        
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(self.newAccount(_:))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(self.pickerDone(_:))
        
        toolBar.setItems([new, flexSpace, done], animated: true)
        
        let userPlist = UserDefaults.standard
        
        self.accountList = userPlist.stringArray(forKey: "accountList") ?? [String]()
        
        if self.accountList.isEmpty {
            self.account.placeholder = "등록된 계정이 없습니다."
            self.gender.isEnabled = false
            self.married.isEnabled = false
        } else {
            if let selectedAccount = userPlist.string(forKey: "selectedAccount") {
                let customPlist = "\(selectedAccount).plist"
                
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist]).first!
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
                
                self.selectingAccount = selectedAccount
                self.account.text = selectedAccount
                self.name.text = data.value(forKey: "name") as? String
                self.gender.selectedSegmentIndex = data.value(forKey: "gender") as! Int
                self.married.isOn = data.value(forKey: "married") as! Bool
            }
        }
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.newAccount(_:)))
        
        self.navigationItem.title = "사용자 정보"
        self.navigationItem.rightBarButtonItems = [addBtn]
        
    }
    
    @objc func newAccount(_ sender: Any) {
        self.view.endEditing(true)
        
        let alert = UIAlertController(title: "새 계정을 입력하세요", message: nil, preferredStyle: .alert)
        
        alert.addTextField() {
            $0.placeholder = "ex) test@test.com"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            
            if let account = alert.textFields?[0].text {
                self.accountList.append(account)
                self.account.text = account
                self.selectingAccount = account
                
                self.name.text = ""
                self.gender.selectedSegmentIndex = 0
                self.married.isOn = false
                
                let plist = UserDefaults.standard
                plist.setValue(self.accountList, forKey: "accountList")
                
                plist.setValue(account, forKey: "selectedAccount")
                
                plist.synchronize()
                
                self.gender.isEnabled = true
                self.married.isEnabled = true
            }
        })
        
        self.present(alert, animated: false)
    }
    
    @objc func pickerDone(_ sender: Any) {
        
        let userPlist = UserDefaults.standard
        userPlist.setValue(self.selectingAccount, forKey: "selectedAccount")
        userPlist.synchronize()
        
        self.account.text = self.selectingAccount
        
        let customPlist = "\(self.account.text!).plist"
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let path = paths[0] as NSString
        let plist = path.strings(byAppendingPaths: [customPlist]).first!
        let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
        
        self.name.text = data.value(forKey: "name") as? String ?? ""
        self.gender.selectedSegmentIndex = data.value(forKey: "gender") as? Int ?? 0
        self.married.isOn = data.value(forKey: "married") as? Bool ?? false
        
        self.view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 && !(self.accountList.isEmpty){
            
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            
            alert.addTextField() {
                $0.text = self.name.text
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                
                let value = alert.textFields?[0].text
                
//                let plist = UserDefaults.standard
//                plist.setValue(value, forKey: "name")
//                plist.synchronize()
                
                let customPlist = "\(self.account.text!).plist"
                
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist]).first!
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
            
                data.setValue(value, forKey: "name")
                data.write(toFile: plist, atomically: true)
                
                self.name.text = value
            })
            
            self.present(alert, animated: false)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if selectingAccount == self.accountList[row] {
            
            pickerView.selectRow(row, inComponent: 0, animated: false)
            
        }
        return self.accountList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if self.accountList.count == 0 {
            return
        }
        
        self.selectingAccount = self.accountList[row]
    }
}
