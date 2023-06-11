//
//  ProfileViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let accountInfoView = UIView()
    let orderHistoryView = UIView()
    let shoseSizeView = UIView()
    
    let accountInfoText = UILabel()
    let orderHistoryText = UILabel()
    let shoseSizeText = UILabel()
    
    let iconA = UIImageView()
    let iconO = UIImageView()
    let iconS = UIImageView()
    var counter = UILabel()
    
    let usefulLinksView = UIView()
    let separator = UIView()
    let linkText1 = UILabel()
    let linkText2 = UILabel()
    let linkIcon1 = UIImageView()
    let linkIcon2 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Color.grayBackround
        title = "Profile"
        navigationController?.tabBarItem.title = Resources.String.TabBar.profile

        layoutView()
        configure()
        addGestureRecognizers()
    }
    
    func configure() {
        [accountInfoView, orderHistoryView, shoseSizeView, usefulLinksView].forEach { UIView in
            UIView.backgroundColor = .white
            UIView.layer.cornerRadius = 12
        }
        accountInfoText.text = "Account Information"
        orderHistoryText.text = "Order History"
        shoseSizeText.text = "Shose size"
        
        [iconA, iconS, iconO].forEach { UIImageView in
            UIImageView.image = UIImage(systemName: "chevron.right")
            UIImageView.tintColor = Resources.Color.gray
        }
        
        counter.text = "41,5"
        counter.textColor = Resources.Color.gray
        
        separator.backgroundColor = Resources.Color.grayLight
        linkText1.text = "How to know your shoe size?"
        linkText2.text = "How to check the authenticity of the shoe?"
        linkText2.numberOfLines = 0
        [linkIcon1, linkIcon2].forEach { UIImageView in
            UIImageView.image = UIImage(named: "LinkIcon")
        }
    }
    
    func addGestureRecognizers() {
        accountInfoView.isUserInteractionEnabled = true
        let tapA = UITapGestureRecognizer(target: self, action: #selector(goToAccounInfo))
        accountInfoView.addGestureRecognizer(tapA)
        
        shoseSizeView.isUserInteractionEnabled = true
        let tapS = UITapGestureRecognizer(target: self, action: #selector(goToShoeSize))
        shoseSizeView.addGestureRecognizer(tapS)
        
        linkIcon1.isUserInteractionEnabled = true
        let tapL1 = UITapGestureRecognizer(target: self, action: #selector(goToLink1))
        linkIcon1.addGestureRecognizer(tapL1)
        
        linkIcon2.isUserInteractionEnabled = true
        let tapL2 = UITapGestureRecognizer(target: self, action: #selector(goToLink2))
        linkIcon2.addGestureRecognizer(tapL2)
    }
    
    @objc func goToAccounInfo() {
        let vc = AccounInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = ""
//        tabBarController?.tabBar.isHidden = true
    }
    @objc func goToShoeSize() {
        let vc = ShoeSizeViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = ""
    }
    @objc func goToLink1() {
        let vc = LinkOneViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = ""
    }
    @objc func goToLink2() {
        let vc = LinkTwoViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = ""
    }
    
    
    func layoutView() {
        [accountInfoView, orderHistoryView, shoseSizeView].forEach{ view.addSubview($0) }
        
        accountInfoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        orderHistoryView.snp.makeConstraints { make in
            make.top.equalTo(accountInfoView).inset(16+52)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        shoseSizeView.snp.makeConstraints { make in
            make.top.equalTo(orderHistoryView).inset(68)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        
        [accountInfoText, iconA].forEach{accountInfoView.addSubview($0)}
        accountInfoText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        iconA.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        
        [orderHistoryText, iconO].forEach{orderHistoryView.addSubview($0)}
        orderHistoryText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        iconO.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        
        [shoseSizeText, iconS, counter].forEach{shoseSizeView.addSubview($0)}
        shoseSizeText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        iconS.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        counter.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(iconS).inset(24)
        }
        
        view.addSubview(usefulLinksView)
        usefulLinksView.snp.makeConstraints { make in
            make.top.equalTo(shoseSizeView).inset(68)
            make.left.right.equalToSuperview()
            make.height.equalTo(126)
        }
        [separator, linkIcon1, linkIcon2, linkText1, linkText2].forEach{ usefulLinksView.addSubview($0)}
        linkText1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(16)
        }
        separator.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(linkText1).inset(-15)
            make.height.equalTo(0.5)
        }
        linkText2.snp.makeConstraints { make in
            make.top.equalTo(separator).inset(15)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo(260)
        }
        linkIcon1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.right.equalToSuperview().inset(16)
        }
        linkIcon2.snp.makeConstraints { make in
            make.top.equalTo(separator).inset(25)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    
}
