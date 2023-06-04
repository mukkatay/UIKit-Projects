//
//  ProfileViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        navigationController?.tabBarItem.title = Resources.String.TabBar.profile

        view.backgroundColor = Resources.Color.grayBackround
    }

}
