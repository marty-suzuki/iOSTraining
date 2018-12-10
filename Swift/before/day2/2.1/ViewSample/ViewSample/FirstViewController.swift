//
//  FirstViewController.swift
//  ViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    static func create() -> UIViewController {
        let viewController = FirstViewController()
        viewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "first"), tag: 0)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
