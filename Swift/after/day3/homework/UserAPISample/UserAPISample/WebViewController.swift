//
//  WebViewController.swift
//  UserAPISample
//
//  Created by 鈴木 大貴 on 2019/01/25.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    let webview = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    let url: URL

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // webviewをviewに追加する
        webview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webview)
        view.addConstraints([
            NSLayoutConstraint(item: webview, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webview, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webview, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webview, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])

        // urlをロードする
        webview.load(URLRequest(url: url))
    }
}
