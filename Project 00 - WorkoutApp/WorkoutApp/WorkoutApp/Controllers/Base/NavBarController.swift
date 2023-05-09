//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Recources.Color.titleGray,
            .font: Recources.Fonts.helveticaRegular(with: 17)
        ]
        
        navigationBar.addBottomBorder(with: Recources.Color.separator, height: 1)
    }
}
