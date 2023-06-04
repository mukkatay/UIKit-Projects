//
//  TabBarController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

enum Tabs: Int {
    case catalog
    case cart
    case profile
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Color.gray.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.masksToBounds = true
        
        let catalogController = CatalogViewController()
        let cartController = CartViewController()
        let profileController = ProfileViewController()
        
        let catalogNavigation = UINavigationController(rootViewController: catalogController)
        let cartNavigation = UINavigationController(rootViewController: cartController)
        let profileNavigation = UINavigationController(rootViewController: profileController)
        
        catalogNavigation.tabBarItem = UITabBarItem(title: Resources.String.TabBar.catalog,
                                                    image: Resources.Images.TabBar.catalog,
                                                    tag: Tabs.catalog.rawValue)
        cartNavigation.tabBarItem = UITabBarItem(title: Resources.String.TabBar.cart,
                                                 image: Resources.Images.TabBar.cart,
                                                    tag: Tabs.cart.rawValue)
        profileNavigation.tabBarItem = UITabBarItem(title: Resources.String.TabBar.profile,
                                                    image: Resources.Images.TabBar.profile,
                                                    tag: Tabs.profile.rawValue)
        
        setViewControllers([
            catalogNavigation,
            cartNavigation,
            profileNavigation
        ], animated: true)
    }

}
