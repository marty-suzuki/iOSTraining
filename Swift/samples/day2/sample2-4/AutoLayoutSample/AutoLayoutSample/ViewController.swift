//
//  ViewController.swift
//  AutoLayoutSample
//
//  Created by 鈴木大貴 on 2016/10/25.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var brownView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        brownView.addSubview(greenView)

        greenView.topAnchor.constraint(equalTo: brownView.topAnchor, constant: 50).isActive = true
        greenView.leadingAnchor.constraint(equalTo: brownView.leadingAnchor, constant: 50).isActive = true
        greenView.trailingAnchor.constraint(equalTo: brownView.trailingAnchor, constant: -50).isActive = true
        greenView.bottomAnchor.constraint(equalTo: brownView.bottomAnchor, constant: -50).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
