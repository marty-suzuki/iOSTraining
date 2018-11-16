//
//  ChildViewController.swift
//  VCCustomization
//
//  Created by 鈴木 大貴 on 2018/11/14.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

protocol ChildViewControllerDelegate: AnyObject {
    func childViewControllerDidTapClose(_ viewController: ChildViewController)
}

class ChildViewController: UIViewController {

    weak var delegate: ChildViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ button: UIButton) {
        delegate?.childViewControllerDidTapClose(self)
    }
}
