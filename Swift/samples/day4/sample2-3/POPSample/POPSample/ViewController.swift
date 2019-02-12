//
//  ViewController.swift
//  POPSample
//
//  Created by 鈴木 大貴 on 2016/11/10.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardObservable {
    
    @IBOutlet weak var textField: UITextField!

    var keyboardWillShow: (Notification) -> Void = { _ in
        //キーボードが表示される前の処理
        print(#function)
    }

    var keyboardDidShow: (Notification) -> Void = { _ in
        //キーボードが表示された後の処理
        print(#function)
    }

    var keyboardWillHide: (Notification) -> Void = { _ in
        //キーボードが非表示にされる前の処理
        print(#function)
    }

    var keyboardDidHide: (Notification) -> Void = { _ in
        //キーボードが非表示にされた後の処理
        print(#function)
    }
    
    var keyboardObservers: [NSObjectProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
}

