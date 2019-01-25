//
//  ViewController.swift
//  KeyboardNotificationSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: 右ボタンを作成
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "keyboard hide",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(ViewController.rightButtonTapped(_:)))

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main,
                                               using: { [weak self] in self?.keyboardWillShow($0) })
        
        // TODO: キーボードが隠れる際の通知を登録
    }

    //MARK: - KeyboardNotification
    func keyboardWillShow(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintをキーボードの高さに再設定する（userInfoのUIKeyboardFrameEndUserInfoKeyの値を参照する）
    }
    
    func keyboardWillHide(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintを0に再設定する
    }
    
    // TODO: キーボードを隠す処理
}

