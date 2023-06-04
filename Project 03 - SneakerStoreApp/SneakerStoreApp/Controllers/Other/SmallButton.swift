//
//  SmallButton.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 04.06.2023.
//

import UIKit

class SmallButton: UIView {
    
    let plusIcon = UIImageView()
    let minusIcon = UIImageView()
    let countLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = Resources.Color.black
        layer.cornerRadius = 18
        minusIcon.image = UIImage(named: "subtract")
        plusIcon.image = UIImage(named: "add")
        countLabel.text = "3"
        countLabel.textColor = Resources.Color.white
    }
    
    func layoutView() {
        [plusIcon, countLabel, minusIcon].forEach{ self.addSubview($0) }
        minusIcon.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(6)
            $0.left.equalToSuperview().inset(39)
        }
        countLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        plusIcon.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(6)
            $0.right.equalToSuperview().inset(39)
        }
    }
    
    func addTargetToButton() {
        
    }
}
