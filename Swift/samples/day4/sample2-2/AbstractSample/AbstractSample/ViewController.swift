//
//  ViewController.swift
//  AbstractSample
//
//  Created by 鈴木 大貴 on 2016/11/06.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dailyView = DailyChoiceView.view()
    
    var sharedObjects: [SharedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        dailyView.delegate = self
        dailyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dailyView)
        view.addConstraints([
            dailyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dailyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dailyView.heightAnchor.constraint(equalToConstant: dailyView.bounds.size.height),
            dailyView.widthAnchor.constraint(equalToConstant: dailyView.bounds.size.width)
        ])
        
        sharedObjects = (0..<10).map { _ in
            SharedObject.shared
        }
    }
}

extension ViewController: DailyViewDelegate {
    func dailyView(view: DailyView, didTapClose button: UIButton) {
        dailyView.removeFromSuperview()
    }
}

extension ViewController: DailyChoiceViewDelegate {
    func dailyView(view: DailyView, didTapNo button: UIButton) {
        print("no tapped")
    }
    
    func dailyView(view: DailyView, didTapYes button: UIButton) {
        print("yes tapped")
    }
}

class SharedObject {
    
    static let shared = SharedObject()
    
    private init() {}
    
    func doSomething() {
        //doSomething
    }
}
