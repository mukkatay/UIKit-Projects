////
////  BigButton.swift
////  SneakerStoreApp
////
////  Created by Akyl Mukatay  on 04.06.2023.
////
//
//import UIKit
//
//class BigButton: UIView {
//
//    var button = UIButton()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        layoutView()
//        configure()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configure() {
//        button.backgroundColor = Resources.Color.black
//        button.layer.cornerRadius = 25
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//    }
//
//    func layoutView() {
//        self.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.top.bottom.left.right.equalToSuperview()
//            make.height.equalTo(54)
//        }
//    }
//
//    func setTitle(text: String) {
//        button.setTitle(text, for: .normal)
//    }
//
//    @objc func buttonAction() {
//
//    }
//
//}
