//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

class OverviewController: BaseController {
    
    private let allWorkoutsButton = SecondaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    override func configure() {
        super.configure()
        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Recources.Strings.Overview.allWorkoutButton)
        allWorkoutsButton.addTarget(
            self,
            action: #selector(allWorkoutsButtonAction),
            for: .touchUpInside
        )
    }
}

@objc extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All Workouts button tapped!")
    }
}
