//
//  AccounInfoViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 06.06.2023.
//

import UIKit

class AccounInfoViewController: UIViewController {
    
    let usernameTextfield = UITextField()
    let oldPasswordTextfield = UITextField()
    let newPasswordTextfield = UITextField()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account Information"
        view.backgroundColor = .white
        
        configure()
        layoutView()
        backAction()
    }
    
    func configure() {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor.black
        }
        
        [usernameTextfield, oldPasswordTextfield, newPasswordTextfield].forEach { UITextField in
            UITextField.backgroundColor = Resources.Color.grayBackround
            UITextField.layer.cornerRadius = 4
            UITextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
            UITextField.leftViewMode = .always
        }
        usernameTextfield.placeholder = "Username"
        oldPasswordTextfield.placeholder = "Old Password"
        oldPasswordTextfield.isSecureTextEntry = true
        newPasswordTextfield.placeholder = "New Password"
        newPasswordTextfield.isSecureTextEntry = true
        
        button.setTitle("Save changes", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(saveChangesAction), for: .touchUpInside)
    }
    
    @objc func saveChangesAction() {
        print("Save changes")
    }
    
    func backAction() {
        navigationItem.backAction = UIAction(handler: { _ in
            let controller = UIAlertController(title: "Are you sure?", message: "You lose your data", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            controller.addAction(cancel)
            controller.addAction(ok)
            self.present(controller, animated: true)
        })
    }
    
    func layoutView() {
        [usernameTextfield, oldPasswordTextfield, newPasswordTextfield, button].forEach{view.addSubview($0)}
        usernameTextfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(26)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        oldPasswordTextfield.snp.makeConstraints { make in
            make.top.equalTo(usernameTextfield).inset(64)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        newPasswordTextfield.snp.makeConstraints { make in
            make.top.equalTo(oldPasswordTextfield).inset(64)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(58)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        
    }

}
