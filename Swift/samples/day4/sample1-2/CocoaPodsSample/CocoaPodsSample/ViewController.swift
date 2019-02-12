//
//  ViewController.swift
//  CocoaPodsSample
//
//  Created by 鈴木大貴 on 2016/11/04.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import APIKit
import Reachability
import Result
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reachability = Reachability.forInternetConnection()!
        let status = reachability.currentReachabilityStatus()
        
        switch status {
        case .NotReachable:
            print("not reachable")
        case .ReachableViaWiFi:
            print("wifi")
        case .ReachableViaWWAN:
            print("wwan")
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let request = UserGetRequest()
        Session.send(request) { result in
            switch result {
            case let .success(response):
                print(response.name)

            case let .failure(error):
                print(error)
            }
        }
    }
}

struct UserGetRequest: Request {
    typealias Response = User

    let path: String = "/users/marty-suzuki"
}

struct User: Decodable {
    let name: String
}

// MARK: - Request extensions

extension Request {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }

    var method: HTTPMethod {
        return .get
    }

    var dataParser: DataParser {
        return DecodableParser()
    }
}

struct DecodableParser: DataParser {
    let contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        return data
    }
}

extension Request where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw APIKit.ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}
