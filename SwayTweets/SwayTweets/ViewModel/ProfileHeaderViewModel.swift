//
//  ProfileHeaderViewModel.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 19.06.2023.
//

import UIKit

struct ProfileHeaderViewModel {
    private let user: User
    
    var followersString: NSAttributedString? {
        return attributedText(withTitle: 0, text: " followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withTitle: 2, text: " following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return "Follow"
        }
    }
    
    init(user: User) {
        self.user = user
    }
    
    fileprivate func attributedText(withTitle value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedTitle.append(NSAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributedTitle
    }
}
