//
//  MainTabController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        
        configureViewControllers()
    }
    
    //MARK: - Helpers
    func configureViewControllers() {
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.systemGray.cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.masksToBounds = true
        
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
