//
//  ProfileHeaderViewModel.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 19.06.2023.
//

import UIKit

struct ProfileHeaderViewModel {
    private let user: User
    
    let usernameText: String
    
    var followersString: NSAttributedString? {
        return attributedText(withTitle: user.stats?.followers ?? 0, text: " followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withTitle: user.stats?.following ?? 0, text: " following")
    }
    
    var actionButtonTitle: String {
        
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        if !user.isFollowed && !user.isCurrentUser {
            return "Follow"
        }
        
        if user.isFollowed {
            return "Following"
        }
        
        return "Loading"
    }
    
    init(user: User) {
        self.user = user
        
        self.usernameText = "@" + user.username
    }
    
    fileprivate func attributedText(withTitle value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedTitle.append(NSAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributedTitle
    }
}
