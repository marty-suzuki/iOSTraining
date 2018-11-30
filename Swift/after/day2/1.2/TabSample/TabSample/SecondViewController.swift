//
//  SecondViewController.swift
//  TabSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    static func createWithTabBarItem() -> UIViewController {
        let viewController = SecondViewController()
        viewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "second"), tag: 1)
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

