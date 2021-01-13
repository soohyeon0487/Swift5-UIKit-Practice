//
//  SideBarViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Soohyeon Lee on 2021/01/11.
//

import UIKit

class SideBarViewController: UITableViewController {
    
    
    let titles = [
        "메뉴 01",
        "메뉴 02",
        "메뉴 03",
        "메뉴 04",
        "메뉴 05"
    ]
    
    let icons = [
        UIImage(systemName: "pencil"),
        UIImage(systemName: "scribble"),
        UIImage(systemName: "highlighter"),
        UIImage(systemName: "lasso"),
        UIImage(systemName: "trash")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accoutLabel = UILabel()
        accoutLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        
        accoutLabel.text = "sqlpro@naver.com"
        accoutLabel.textColor = .white
        accoutLabel.font = .boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accoutLabel)
        
        self.tableView.tableHeaderView = v
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        cell.textLabel?.font = .systemFont(ofSize: 14)
        
        return cell
    }

}
