//
//  AppDelegate.swift
//  UserAPISample
//
//  Created by 鈴木 大貴 on 2019/01/25.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = UINavigationController(rootViewController: ViewController())
            window.makeKeyAndVisible()
            return window
        }()

        return true
    }
}

