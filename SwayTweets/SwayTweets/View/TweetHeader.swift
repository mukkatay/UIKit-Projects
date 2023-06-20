//
//  TweetHeader.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 20.06.2023.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
}
