//
//  TabBarController.swift
//  FocusFlow
//
//  Created by Akyl Mukatay  on 29.06.2023.
//

import UIKit

enum Tabs: Int {
    case main
    case settings
    case history
}

class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tabBar.tintColor = .white
        tabBar.backgroundColor = .clear
        tabBar.unselectedItemTintColor = .lightGray
        
        let mainController = MainViewController()
        let settingsController = SettingsViewController()
        let historyController = HistoryViewController()
        
        let mainNav = UINavigationController(rootViewController: mainController)
        let settingsNav = UINavigationController(rootViewController: settingsController)
        let historyNav = UINavigationController(rootViewController: historyController)
        
        mainNav.tabBarItem.image = UIImage(systemName: "timer")
        settingsNav.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")
        historyNav.tabBarItem.image = UIImage(systemName: "doc")
        
        setViewControllers([mainNav, settingsNav, historyNav], animated: true)
    }
    
}
