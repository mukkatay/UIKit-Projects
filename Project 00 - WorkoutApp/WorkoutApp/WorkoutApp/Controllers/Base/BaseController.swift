//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        configure()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Recources.Color.backgrond
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar left button tapped!")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar right button tapped!")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Recources.Color.active, for: .normal)
        button.setTitleColor(Recources.Color.inactive, for: .disabled)
        button.titleLabel?.font = Recources.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
