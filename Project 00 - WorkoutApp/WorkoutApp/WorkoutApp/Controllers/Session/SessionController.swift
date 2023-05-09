//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Recources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Recources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Recources.Strings.Session.navBarRight)
    }


}
