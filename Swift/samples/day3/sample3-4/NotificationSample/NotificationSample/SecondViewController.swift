//
//  SecondViewController.swift
//  NotificationSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    private var observer: NSObjectProtocol?

    static func makeWithTabBarItem() -> SecondViewController {
        let viewController = SecondViewController()
        viewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "second"), tag: 0)
        return viewController
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationHandler: (Notification) -> Void = { [weak self] notification in
            self?.handleNotification(notification)
        }

        self.observer = NotificationCenter.default
            .addObserver(forName: Notification.Name(rawValue: "pushNotificationTapped"),
                         object: nil,
                         queue: OperationQueue.main,
                         using: notificationHandler)
    }

    private func handleNotification(_ notification: Notification) {
        guard let value = notification.userInfo?["key"] as? String else { return }
        label.text = value
    }
}

