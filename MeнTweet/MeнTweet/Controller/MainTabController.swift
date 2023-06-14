//
//  MainTabController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .black
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        
        configureViewControllers()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.systemGray.cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.masksToBounds = true
        tabBar.tintColor = .black
        
        let feed = FeedController()
        let feedNavigation = templateNavigationController(imageName: "home", rootViewController: feed)
        
        let explore = ExploreController()
        let exploreNavigation = templateNavigationController(imageName: "search", rootViewController: explore)
        
        let notifications = NotificationsController()
        let notificationsNavigation = templateNavigationController(imageName: "heart", rootViewController: notifications)
        
        let conversations = ConversationsControllers()
        let conversationsNavigation = templateNavigationController(imageName: "mail", rootViewController: conversations)
        
        setViewControllers([
            feedNavigation,
            exploreNavigation,
            notificationsNavigation,
            conversationsNavigation
        ], animated: true)
        

    }
    
    func templateNavigationController(imageName: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(named: imageName)
        return nav
    }
}
