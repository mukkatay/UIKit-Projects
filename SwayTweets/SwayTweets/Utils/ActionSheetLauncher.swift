//
//  ActionSheetLauncher.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 21.06.2023.
//

import UIKit

class ActionSheetLauncher: NSObject {
    
    //MARK: - Properties
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init()
    }
    
    //MARK: - Helpers
    
    func show() {
        print(user.username)
    }
    
}
