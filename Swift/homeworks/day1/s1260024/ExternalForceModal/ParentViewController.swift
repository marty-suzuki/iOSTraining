//
//  ParentViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木 大貴 on 2018/11/16.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO: SecondViewControllerのdelegateを準拠する
class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTapped(_ sender: UIButton) {
        showSecondViewController()
    }

    private func showSecondViewController() {
        let child = ChildViewController()
        // TODO: secondViewControllerのdelegateを自分にセット
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
    }

    // TODO: SecondViewController の delegateメソッドを実装
}
