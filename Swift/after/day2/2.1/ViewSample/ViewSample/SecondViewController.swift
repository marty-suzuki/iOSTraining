//
//  SecondViewController.swift
//  ViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    static func create() -> UIViewController {
        let viewController = SecondViewController()
        viewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "second"), tag: 0)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.viewWithTag(5)?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print(sender.tag)
    }
}

