//
//  AppDelegate.swift
//  NotificationSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = {
                let tabBarController = UITabBarController(nibName: nil, bundle: nil)
                let viewControllers = [FirstViewController.makeWithTabBarItem(),
                                       SecondViewController.makeWithTabBarItem()]
                tabBarController.setViewControllers(viewControllers, animated: false)
                return tabBarController
            }()
            window.makeKeyAndVisible()
            return window
        }()

        return true
    }
}
