//
//  SearchPostViewController.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import UIKit

final class SearchPostViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    private let searchModel = SearchPostModel()
    private var posts: [QiitaPost] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: - tableViewのdataSourceを設定

        // TODO: - PostCellをtableViewに登録


        searchModel.delegate = self
        searchPosts()
    }

    func showRetryAlert(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            // TODO: - リトライを選択いしたら検索を再実行

        })
        present(alertController, animated: true, completion: nil)
    }

    func searchPosts() {
        // TODO: - ローディングを実行


        searchModel.search(query: "swift")
    }
}

extension SearchPostViewController: SearchPostModelDelegate {
    func searchPostModel(_ model: SearchPostModel, didFinishSearch posts: [QiitaPost]) {
        self.posts += posts

        DispatchQueue.main.async {
            // TODO: - ローディングを実行を止めて、tableViewを更新

        }
    }

    func searchPostModel(_ model: SearchPostModel, didReceive error: Error) {
        DispatchQueue.main.async {
            // TODO: - ローディングを実行を止めて、エラーのアラートをほ表示

        }
    }
}

extension SearchPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: - PostCellをtableViewからdequeueする

        // TODO: - セルに表示する内容を設定する

        return cell
    }
}

extension SearchPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        // 余裕があったらWebviewでpost.urlを表示する
    }
}
