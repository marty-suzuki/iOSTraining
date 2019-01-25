//
//  FirstViewController.swift
//  NotificationSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    static func makeWithTabBarItem() -> FirstViewController {
        let viewController = FirstViewController()
        viewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "first"), tag: 0)
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pushNotificationTapped(_ sender: UIButton) {
        let dict = ["key" : "value"]
        NotificationCenter.default
            .post(name: Notification.Name(rawValue: "pushNotificationTapped"),
                  object: nil,
                  userInfo: dict)
    }
}

