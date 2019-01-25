//
//  AppDelegate.swift
//  TextSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
            return window
        }()

        return true
    }
}
