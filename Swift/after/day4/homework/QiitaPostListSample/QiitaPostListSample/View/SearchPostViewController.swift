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
        tableView.dataSource = self
        tableView.delegate = self

        // TODO: - PostCellをtableViewに登録
        tableView.register(PostCell.nib, forCellReuseIdentifier: PostCell.identifier)

        searchModel.delegate = self
        searchPosts()
    }

    func showRetryAlert(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            // TODO: - リトライを選択いしたら検索を再実行
            self?.searchPosts()
        })
        present(alertController, animated: true, completion: nil)
    }

    func searchPosts() {
        // TODO: - ローディングを実行
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        searchModel.search(query: "swift")
    }
}

extension SearchPostViewController: SearchPostModelDelegate {
    func searchPostModel(_ model: SearchPostModel, didFinishSearch posts: [QiitaPost]) {
        self.posts += posts

        DispatchQueue.main.async {
            // TODO: - ローディングを実行を止めて、tableViewを更新
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.tableView.reloadData()
        }
    }

    func searchPostModel(_ model: SearchPostModel, didReceive error: Error) {
        DispatchQueue.main.async {
            // TODO: - ローディングを実行を止めて、エラーのアラートをほ表示
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.showRetryAlert(error: error)
        }
    }
}

extension SearchPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: - PostCellをtableViewからdequeueする
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell

        // TODO: - セルに表示する内容を設定する
        cell.configure(with: posts[indexPath.row])

        return cell
    }
}

extension SearchPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        // 余裕があったらWebviewでpost.urlを表示する
    }
}
