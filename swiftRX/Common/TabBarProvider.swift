//
//  TabBarProvider.swift
//  swiftRX
//
//  Created by otc on 2018/9/20.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit
import ESTabBarController_swift

enum TabBarProvider {
    static func customStyle() -> ESTabBarController {
        let tabBarController = ESTabBarController()
        let v1 = CustomerNavigationController(rootViewController: ViewController())
        let v2 = CustomerNavigationController(rootViewController: ViewController())
        let v3 = CustomerNavigationController(rootViewController: ViewController())
        let v4 = CustomerNavigationController(rootViewController: ViewController())
        let v5 = CustomerNavigationController(rootViewController: ViewController())
        
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
}
