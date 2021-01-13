//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTitleNew()
    }
    
    func initTitle() {
        
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.textColor = .white
        nTitle.font = .systemFont(ofSize: 15)
        nTitle.text = "58개 숙소 \n 1박 (1월 10일 ~ 1월 11일)"
        
        self.navigationItem.titleView = nTitle
        
        let color = UIColor(red: 0.22, green: 0.49, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }

    func initTitleNew() {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = .systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = .systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박 (1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.22, green: 0.49, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }

}

