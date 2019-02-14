//
//  QiitaPost.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct QiitaPost: Decodable {

    let id: String
    let title: String
    let commentsCount: Int
    let likesCount: Int
    let reactionsCount: Int
    let user: QiitaUser
    let url: URL
    let createdAt: Date
    let updatedAt: Date

    // TODO: - CodingKeysを実装
}

extension QiitaPost {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        return formatter
    }()

    var createdAtString: String {
        // "YYYY/MM/dd"形式のStringに変換をして表示
        return
    }

    var updatedAtString: String {
        // "YYYY/MM/dd"形式のStringに変換をして表示
        return
    }
}
