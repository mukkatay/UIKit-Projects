//
//  UserCell.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 19.06.2023.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Proreties
    
    var user: User? {
        didSet { configure() }
    }
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 32, height: 32)
        iv.layer.cornerRadius = 32 / 2
        iv.backgroundColor = .mainAppColor
        
        return iv
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Username"
        return label
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Fullname"
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leadingAnchor, paddingLeft: 12)
        
        let stack = UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.trailingAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure() {
        guard let user = user else { return }
        
        profileImageView.sd_setImage(with: user.profileImageUrl)
        usernameLabel.text = user.username
        fullnameLabel.text = user.fullname
    }
}
