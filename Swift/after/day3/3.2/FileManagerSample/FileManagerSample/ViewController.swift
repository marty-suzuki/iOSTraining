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
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // TODO: URLから絶対パスを取得
        guard let url = urls.first else { return nil }
        
        // TODO: 保存するファイル（save.dat）をDocumentのパスに追加
        let newUrl = url.appendingPathComponent("save.dat")
        
        // TODO: ファイルパスを返す
        return newUrl
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // TODO: textField1とtextField2の内容をSaveObjectに変換して保存
        guard let fileUrl = fileURL() else { return }

        let saveObject = SaveObject(textField1: textField1.text ?? "",
                                    textField2: textField2.text ?? "")
        do {
            let data = try JSONEncoder().encode(saveObject)
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                try FileManager.default.removeItem(at: fileUrl)
            }
            FileManager.default.createFile(atPath: fileUrl.path, contents: data, attributes: nil)
            print("success")
        } catch let e {
            print("failed \(e)")
        }
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        // TODO: データを読み込んで、textField1とtextField2に内容を表示
        guard let fileUrl = fileURL(), FileManager.default.fileExists(atPath: fileUrl.path) else {
            print("not exist")
            return
        }

        guard let data = FileManager.default.contents(atPath: fileUrl.path) else {
            return
        }

        do {
            let saveObject = try JSONDecoder().decode(SaveObject.self, from: data)
            textField1.text = saveObject.textField1
            textField2.text = saveObject.textField2
        } catch let e {
            print("failed \(e)")
        }
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        // TODO: ファイルの削除
        guard let fileUrl = fileURL(), FileManager.default.fileExists(atPath: fileUrl.path) else {
            print("not exist")
            return
        }
        do {
            try FileManager.default.removeItem(atPath: fileUrl.path)
        } catch {
            print("failed")
        }
    }
}

struct SaveObject: Codable {
    let textField1: String
    let textField2: String
}
