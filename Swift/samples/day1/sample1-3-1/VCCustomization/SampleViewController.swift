//
//  SampleViewController.swift
//  VCCustomization
//
//  Created by marty-suzuki on 2018/11/13.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = "Test"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "YES"
    }
}
