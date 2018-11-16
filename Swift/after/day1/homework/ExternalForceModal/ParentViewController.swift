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
    
    // viewDidAppearが呼ばれたかどうかのproperty
    private var isFirstViewDidAppear = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 初回はif文に入って処理が終わる
        if isFirstViewDidAppear {
            isFirstViewDidAppear = false
            return
        }
        // 2回目以降はSecondViewControllerが表示される
        showSecondViewController()
    }

    @IBAction func showTapped(_ sender: UIButton) {
        showSecondViewController()
    }

    private func showSecondViewController() {
        let child = ChildViewController()
        // TODO: secondViewControllerのdelegateを自分にセット
        child.delegate = self
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
        present(child, animated: true, completion: nil)
    }
}

extension ParentViewController: ChildViewControllerDelegate {
    // TODO: SecondViewController の delegateメソッドを実装
    func childViewControllerDidTapClose(_ viewController: ChildViewController) {
        dismiss(animated: true, completion: nil)
    }
}
