//
//  SearchPostRequest.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

/// 投稿の検索リクエスト
struct SearchPostRequest: QiitaRequest {
    typealias Response = [QiitaPost]

    let path = "/items"
    var queryParameters: [String : Any]? {
        return ["query": query]
    }

    let query: String

    init(query: String) {
        self.query = query
    }
}
