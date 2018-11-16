//
//  ParentViewController.swift
//  VCCustomization
//
//  Created by 鈴木 大貴 on 2018/11/14.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showChild(_ button: UIButton) {
        let child = ChildViewController()
        child.delegate = self
        present(child, animated: true, completion: nil)
    }
}

extension ParentViewController: ChildViewControllerDelegate {
    func childViewControllerDidTapClose(_ viewController: ChildViewController) {
        dismiss(animated: true, completion: nil)
    }
}
