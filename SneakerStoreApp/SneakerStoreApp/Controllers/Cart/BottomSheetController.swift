//
//  BottomSheetViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 06.06.2023.
//

import UIKit

class BottomSheetController: UIViewController {
    var imageView = UIImageView()
    let textLabel = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Color.grayBackround
        
        configure()
        layoutView()
    }
    
    func configure() {
        view.layer.cornerRadius = 24
        
        imageView.image = UIImage(named: "Img5")
        
        textLabel.text = "Your order is succesfully placed. Thanks!"
        textLabel.numberOfLines = 2
        textLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        textLabel.textAlignment = .center
        
        button.setTitle("Get back to shopping", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(getBackButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func getBackButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func layoutView() {
        [imageView, textLabel, button].forEach{ view.addSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(58)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        textLabel.snp.makeConstraints { make in
            make.bottom.equalTo(button).inset(78)
            make.left.right.equalToSuperview().inset(16)
        }
        
        
    }

}
