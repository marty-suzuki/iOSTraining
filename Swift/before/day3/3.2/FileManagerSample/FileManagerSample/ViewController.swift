//
//  ViewController.swift
//  FileManagerSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func fileURL() -> URL? {
        // TODO: FileManagerを作ってDocumentDirectoryのURLを取得
        
        // TODO: URLから絶対パスを取得
        
        // TODO: 保存するファイル（save.dat）をDocumentのパスに追加
        
        // TODO: ファイルパスを返す
        return nil
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // TODO: textField1とtextField2の内容をSaveObjectに変換して保存
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        // TODO: データを読み込んで、textField1とtextField2に内容を表示
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        // TODO: ファイルの削除
    }
}

struct SaveObject: Codable {
    let textField1: String
    let textField2: String
}
