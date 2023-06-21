//
//  MainTabController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedController else { return }
            
            feed.user = user
        }
    }
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .menTweetRed
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        logUserOut()
        authenticateUserConfigureUI()
        
    }
    
    //MARK: - API
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(uid: uid) { user in
            self.user = user
        }
    }
    
    func authenticateUserConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } else {
            configureViewControllers()
            configureUI()
            fetchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: Did user logged out..")
        } catch let error {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Selectors
    
    @objc func actionButtonTapped() {
        guard let user = user else { return }
        let controller = UploadTweetController(user: user, config: .tweet)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.systemGray.cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.masksToBounds = true
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemGray
        
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
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
