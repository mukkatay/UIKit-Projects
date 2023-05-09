//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Recources.Color.active
        tabBar.barTintColor = Recources.Color.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Recources.Color.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)
        
        overviewNavigation.tabBarItem = UITabBarItem(title: Recources.Strings.TabBar.overview,
                                                     image: Recources.Images.TabBar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: Recources.Strings.TabBar.session,
                                                     image: Recources.Images.TabBar.session,
                                                     tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: Recources.Strings.TabBar.progress,
                                                     image: Recources.Images.TabBar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: Recources.Strings.TabBar.settings,
                                                     image: Recources.Images.TabBar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigation,
            sessionNavigation,
            progressNavigation,
            settingsNavigation
        ],animated: false)
    }
}
