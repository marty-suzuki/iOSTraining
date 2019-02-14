//
//  SearchPostModel.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import APIKit
import Result

protocol SearchPostModelDelegate: AnyObject {
    func searchPostModel(_ model: SearchPostModel, didFinishSearch posts: [QiitaPost])
    func searchPostModel(_ model: SearchPostModel, didReceive error: Error)
}

final class SearchPostModel {

    weak var delegate: SearchPostModelDelegate?

    private let session: Session

    init(session: Session = .shared) {
        self.session = session
    }

    func search(query: String) {
        // 検索のリクエストを実行
        let request = SearchPostRequest(query: query)
        session.send(request) { [weak self] result in
            guard let me = self else {
                return
            }

            // 成功したらdidFinishSearch、失敗したらdidReciveErrorを呼び出す
            switch result {
            case let .success(posts):
                me.delegate?.searchPostModel(me, didFinishSearch: posts)

            case let .failure(error):
                me.delegate?.searchPostModel(me, didReceive: error)
            }
        }
    }
}
