//
//  ChildViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木 大貴 on 2018/11/16.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO:
// delegateのためのプロトコルを定義
protocol ChildViewControllerDelegate: class {
    // ここにDelegateメソッドの定義
}

class ChildViewController: UIViewController {

    // TODO: delegate変数の用意

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeTapped(_ sender: UIButton) {
        // TODO:
        // ボタンがタップされた時に呼ばれるメソッド
        // delegateを介してモーダルを消す
    }
}
