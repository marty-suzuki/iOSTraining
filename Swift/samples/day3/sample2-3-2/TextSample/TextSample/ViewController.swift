//
//  ViewController.swift
//  TextSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textFieldCountLabel: UILabel!
    @IBOutlet weak var textViewCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textView.delegate = self

        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: nil,
                                               queue: .main,
                                               using: { [weak self] in self?.didChangeTextFieldText($0) })

        print(UITextField.textDidChangeNotification.rawValue)
        print(UITextView.textDidChangeNotification.rawValue)

        NotificationCenter.default.addObserver(forName: UITextView.textDidChangeNotification,
                                               object: nil,
                                               queue: .main,
                                               using: { [weak self] in self?.didChangeTextViewText($0) })
    }

    func didChangeTextFieldText(_ notification: Notification) {
        textFieldCountLabel.text = "\(textField.text?.characters.count ?? 0)"
    }
    
    func didChangeTextViewText(_ notification: Notification) {
        textViewCountLabel.text = "\(textView.text?.characters.count ?? 0)"
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldCountLabel.text = "0"
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(text)
        return true
    }
}
