//
//  NewSceneDelegate.swift
//  Chapter03-TabBar
//
//  Created by Soohyeon Lee on 2021/01/10.
//

import UIKit

class NewSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        self.window?.rootViewController = tbC
        
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        tbC.setViewControllers([view01, view02, view03], animated: false)
        1
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(systemName: "doc.on.doc"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(systemName: "photo"), selectedImage: nil)
    }
}
