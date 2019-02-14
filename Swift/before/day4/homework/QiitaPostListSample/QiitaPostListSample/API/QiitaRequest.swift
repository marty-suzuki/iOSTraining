//
//  QiitaRequest.swift
//  QiitaPostListSample
//
//  Created by marty-suzuki on 2019/02/14.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import APIKit

/// QiitaのAPIにアクセスする用のRequest
///
/// - note: ResponseはDecodableになっている前提
protocol QiitaRequest: Request where Response: Decodable {}

extension QiitaRequest {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }

    var method: HTTPMethod {
        return .get
    }

    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()

        // Qiita APIで返ってくる日付は、ISO8601
        decoder.dateDecodingStrategy = .iso8601

        // DecodableDataParserでDataを返しているので、force castしても問題ない
        return try decoder.decode(Response.self, from: object as! Data)
    }
}

/// Decodable向けのDataParser
struct DecodableDataParser: DataParser {
    let contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        return data
    }
}
