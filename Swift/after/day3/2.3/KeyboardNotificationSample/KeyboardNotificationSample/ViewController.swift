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
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main,
                                               using: { [weak self] in self?.keyboardWillHide($0) })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - KeyboardNotification
    func keyboardWillShow(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintをキーボードの高さに再設定する（userInfoのUIKeyboardFrameEndUserInfoKeyの値を参照する）
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let rawAnimationCurve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }

        view.layoutIfNeeded()
        textViewBottomConstraint.constant = -keyboardFrame.size.height
        let animationCurve = UIView.AnimationOptions(rawValue: rawAnimationCurve)
        UIView.animate(withDuration: animationDuration, delay: 0, options: animationCurve, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        print(notification.userInfo)
        
        // TODO: textViewのbottomのconstraintを0に再設定する
        guard
            let userInfo = notification.userInfo,
            let rawAnimationCurve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }

        view.layoutIfNeeded()
        textViewBottomConstraint.constant = 0
        let animationCurve = UIView.AnimationOptions(rawValue: rawAnimationCurve)
        UIView.animate(withDuration: animationDuration, delay: 0, options: animationCurve, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // TODO: キーボードを隠す処理
    @objc func rightButtonTapped(_ button: UIBarButtonItem) {
        textView.resignFirstResponder()
    }
}

