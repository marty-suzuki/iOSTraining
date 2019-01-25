//
//  ViewController.swift
//  UserAPISample
//
//  Created by 鈴木 大貴 on 2019/01/25.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var openWebsiteButton: UIButton! {
        didSet {
            openWebsiteButton.isEnabled = false
        }
    }

    private var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let username = textField.text else { return }
        fetchUser(username)
    }

    @IBAction func openWebsiteButtonTapped(_ sender: UIButton) {
        // user.websiteURLが取得できたら、WebViewControllerを表示する
    }

    private func fetchUser(_ username: String) {
        guard
            let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://qiita.com/api/v2/users/\(encodedUsername)")
        else {
            return
        }

        user = nil
        openWebsiteButton.isEnabled = false

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in

            guard let urlResponse = response as? HTTPURLResponse, let data = data else {
                return
            }

            switch urlResponse.statusCode {
            case 200..<300:
                // DataをUserに変換し、textViewに反映する

                // 取得できたuserをself.userに代入する

                // user.websiteURLがnilじゃない場合は、openWebsiteButton.isEnabledを有効にする

                break

            case 400..<500:
                do {
                    let errorMessage = try JSONDecoder().decode(ErrorMessage.self, from: data)
                    DispatchQueue.main.async {
                        self?.textView.text = "\(errorMessage)"
                    }
                } catch let e {
                    DispatchQueue.main.async {
                        self?.textView.text = "\(e)"
                    }
                }

            default:
                return
            }
        }
        task.resume()
    }
}

struct ErrorMessage: Decodable {
    let message: String
    let type: String
}

struct User: Decodable {
    let description: String?
    let facebookID: String?
    let followeesCount: Int
    let followersCount: Int
    let githubLoginName: String?
    let id: String
    let itemsCount: Int
    let linkedinID: String?
    let location: String?
    let name: String
    let organization: String?
    let permanentID: Int
    let profileImageURL: URL?
    let twitterScreenName: String?
    let websiteURL: URL?
}

extension User {
    private enum CodingKeys: String, CodingKey {
        case description
        case facebookID = "facebook_id"
        case followeesCount = "followees_count"
        case followersCount = "followers_count"
        case githubLoginName = "github_login_name"
        case id
        case itemsCount = "items_count"
        case linkedinID = "linkedin_id"
        case location
        case name
        case organization
        case permanentID = "permanent_id"
        case profileImageURL = "profile_image_url"
        case twitterScreenName = "twitter_screen_name"
        case websiteURL = "website_url"
    }
}


