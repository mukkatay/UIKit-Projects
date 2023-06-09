//
//  ConversationsControllers.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

class ConversationsControllers: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Messages"
    }
}
