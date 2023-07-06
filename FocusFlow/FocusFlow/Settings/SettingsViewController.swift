//
//  SettingsViewController.swift
//  FocusFlow
//
//  Created by Akyl Mukatay  on 29.06.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Settings"
        
        configure()
    }
    
    func configure() {
        
    }

}
