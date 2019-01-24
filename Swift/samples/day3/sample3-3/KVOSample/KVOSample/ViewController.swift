//
//  ViewController.swift
//  KVOSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class Counter: NSObject {
    static let shared = Counter()
    
    @objc dynamic var count: Int = 0
    
    private override init() {
        super.init()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    private var observation: NSKeyValueObservation?
    
    deinit {
        observation?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = "\(Counter.shared.count)"

        let changeHandler: (Counter, NSKeyValueObservedChange<Int>) -> Void = { [weak self] _, change in
            guard let newValue = change.newValue else {
                return
            }
            DispatchQueue.main.async {
                self?.countLabel.text = "\(newValue)"
            }
        }

        self.observation = Counter.shared
            .observe(\Counter.count,
                     options: [.new],
                     changeHandler: changeHandler)
    }

    @IBAction func countDownButtonTapped(_ sender: UIButton) {
        Counter.shared.count = max(0, Counter.shared.count - 1)
    }
    
    @IBAction func countUpButtonTapped(_ sender: UIButton) {
        Counter.shared.count += 1
    }

    @IBAction func pushButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}

