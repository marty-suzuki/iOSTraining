//
//  PostCell.swift
//  GithubStarListSample
//
//  Created by 鈴木 大貴 on 2016/11/05.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit
import Kingfisher

final class PostCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var reactionsCountLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.kf.cancelDownloadTask()
    }

    func configure(with post: QiitaPost) {
        //TODO: - セルの内容設定
        postTitleLabel.text = post.title
        userNameLabel.text = post.user.id
        if let url = post.user.profileImageURL {
            iconImageView.kf.setImage(with: url)
        }
        likesCountLabel.text = "\(post.likesCount)"
        commentsCountLabel.text = "\(post.commentsCount)"
        reactionsCountLabel.text = "\(post.reactionsCount)"
        createdLabel.text = post.createdAtString
        updatedLabel.text = post.updatedAtString
    }
}
