//
//  WelcomeView.swift
//  BookmarkCollector
//
//  Created by Akyl Mukatay  on 05.05.2023.
//

import UIKit

class WelcomeView: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = UIView.ContentMode.top

        return backgroundImage
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.text = "Save all interesting links in one app"
        titleLabel.numberOfLines = 0
        
        return titleLabel
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Let’s start collecting", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        backButton.tintColor = .black
        navigationItem.backBarButtonItem = backButton
        configureAction()
        configureSubviews()
    }
    
    override func loadView() {
        let bgView = UIView()
        bgView.insertSubview(backgroundImage, at: 0)
        view = bgView
    }
 
    private func configureSubviews() {
        [titleLabel, button].forEach{self.view.addSubview($0)}
        
        titleLabel.anchor(bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingBottom: 132, paddingLeft: 16, paddingRight: 16)
        button.anchor(bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingBottom: 50, paddingLeft: 16, paddingRight: 16, height: 58)
    }
    
    private func configureAction() {
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    }

    @objc private func handleNextButton() {
        let vc = ListView()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
