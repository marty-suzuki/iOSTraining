//
//  QiitaUser.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct QiitaUser: Decodable {
    
    let id: String
    let profileImageURL: URL?

    private enum CodingKeys: String, CodingKey {
        case id
        case profileImageURL = "profile_image_url"
    }
}
