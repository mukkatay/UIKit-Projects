//
//  ShoeSizeViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 06.06.2023.
//

import UIKit

class ShoeSizeViewController: UIViewController {
    
    let shoseSizeTextfield = UITextField()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Shoe size"

        configure()
        layoutView()
    }
    
    func configure() {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor.black
        }
        
        shoseSizeTextfield.backgroundColor = Resources.Color.grayBackround
        shoseSizeTextfield.layer.cornerRadius = 4
        shoseSizeTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        shoseSizeTextfield.leftViewMode = .always
        shoseSizeTextfield.placeholder = "41,5"
        shoseSizeTextfield.keyboardType = .numberPad
        
        button.setTitle("Save changes", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(saveChangesAction), for: .touchUpInside)
    }
    
    @objc func saveChangesAction() {
        print("Save shoe size")
    }
    
    func layoutView() {
        [shoseSizeTextfield, button].forEach{ view.addSubview($0) }
        shoseSizeTextfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(26)
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
