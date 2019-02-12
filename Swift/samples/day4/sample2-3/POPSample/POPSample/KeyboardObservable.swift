//
//  KeyboardObservable.swift
//  POPSample
//
//  Created by 鈴木 大貴 on 2016/11/10.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

protocol KeyboardObservable: class {
    var keyboardObservers: [NSObjectProtocol] { get set }
    var keyboardWillShow: (Notification) -> Void { get }
    var keyboardDidShow: (Notification) -> Void { get }
    var keyboardWillHide: (Notification) -> Void { get }
    var keyboardDidHide: (Notification) -> Void { get }
    func addKeyboardObservers()
    func removeKeyboardObservers()
}

extension KeyboardObservable where Self: NSObject {
    func addKeyboardObservers() {
        keyboardObservers = [
            (UIResponder.keyboardWillShowNotification, keyboardWillShow),
            (UIResponder.keyboardDidShowNotification, keyboardDidShow),
            (UIResponder.keyboardWillHideNotification, keyboardWillHide),
            (UIResponder.keyboardDidHideNotification, keyboardDidHide)
        ].map {
            NotificationCenter.default.addObserver(forName: $0.0,
                                                   object: nil,
                                                   queue: .main,
                                                   using: $0.1)
        }
    }
    
    func removeKeyboardObservers() {
        keyboardObservers.forEach { NotificationCenter.default.removeObserver($0) }
        keyboardObservers.removeAll()
    }
}
