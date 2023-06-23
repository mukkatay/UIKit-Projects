//
//  EditProfileFooter.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 23.06.2023.
//

import UIKit

protocol EditProfileFooterDelegate: class {
    func handleLogout()
}

class EditProfileFooter: UIView {

    // MARK: - Properties

    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.backgroundColor = .mainAppColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.mainAppColor.cgColor
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)

        return button
    }()

    weak var delegate: EditProfileFooterDelegate?

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(logoutButton)
        logoutButton.anchor(left: leadingAnchor,
                            right: trailingAnchor,
                            paddingLeft: 16,
                            paddingRight: 16)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers


    // MARK: - Selectors

    @objc func handleLogout() {
        delegate?.handleLogout()
    }
}

