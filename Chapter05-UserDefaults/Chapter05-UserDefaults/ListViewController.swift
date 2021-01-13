//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by Soohyeon Lee on 2021/01/13.
//

import UIKit

class ListViewController: UITableViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        
        let value = sender.selectedSegmentIndex
        
        let plist = UserDefaults.standard
        plist.setValue(value, forKey: "gender")
        plist.synchronize()
        
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.setValue(value, forKey: "married")
        plist.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.row == 0 {
//
//            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
//
//            alert.addTextField() {
//                $0.text = self.name.text
//            }
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
//
//                let value = alert.textFields?[0].text
//
//                let plist = UserDefaults.standard
//                plist.setValue(value, forKey: "name")
//                plist.synchronize()
//
//                self.name.text = value
//            })
//
//            self.present(alert, animated: false)
//        }
    }
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        alert.addTextField() {
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.setValue(value, forKey: "name")
            plist.synchronize()
            
            self.name.text = value
        })
        
        self.present(alert, animated: false)
    }
}
