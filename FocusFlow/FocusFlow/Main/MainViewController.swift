//
//  MainViewController.swift
//  FocusFlow
//
//  Created by Akyl Mukatay  on 29.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let backgroundImage = UIImageView()
    private let focusCategoryButton = UIButton(type: .system)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(backgroundImage, at: 0)
        
        layoutView()
        configure()
    }
    
    // MARK: - Helpers
    
    func layoutView() {
        view.addSubview(focusCategoryButton)
        focusCategoryButton.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, paddingTop: 136, paddingLeft: 110, paddingRight: 110, height: 40)
    }
    
    func configure() {
        backgroundImage.image = UIImage(named: "BG1")
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.center = view.center
        backgroundImage.clipsToBounds = true
        
        focusCategoryButton.setTitle("Focus Category", for: .normal)
        focusCategoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        focusCategoryButton.tintColor = .white
        focusCategoryButton.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.3)
        focusCategoryButton.layer.cornerRadius = 20
        focusCategoryButton.addTarget(self, action: #selector(handleFocusCategoryBtn), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc func handleFocusCategoryBtn() {
        let vc = FocusCategoryViewController()
        vc.view.layer.cornerRadius = 20
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom { _ in
                return 362
            }]
        }
        present(vc, animated: true)
    }

}
