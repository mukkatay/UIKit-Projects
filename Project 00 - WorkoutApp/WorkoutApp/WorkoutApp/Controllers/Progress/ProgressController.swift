//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Workout Progress"
        navigationController?.tabBarItem.title = Recources.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: Recources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Recources.Strings.Progress.navBarRight)
    }


}
