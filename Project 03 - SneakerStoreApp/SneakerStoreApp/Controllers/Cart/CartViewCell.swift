//
//  CartViewCell.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 04.06.2023.
//

import UIKit

class CartViewCell: UICollectionViewCell {
    
    private let stack = UIStackView()
    private let HStack = UIStackView()
    private let VStack = UIStackView()
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private var quantity = ""
    private let button = SmallButton()
    
    var card: CartItem? {
        didSet {
            titleLabel.text = card?.product.name
            descriptionLabel.text = card?.product.description
            priceLabel.text = card?.product.price
            quantity = String(describing: card?.quantity)
            if let image = card?.product.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        stack.backgroundColor = Resources.Color.white
        stack.axis = .horizontal
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 18)

        HStack.axis = .horizontal
        HStack.spacing = 16

        VStack.axis = .vertical
        VStack.spacing = 2
        
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        descriptionLabel.textColor = Resources.Color.grayLight
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.numberOfLines = 0
        
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        button.countLabel.text = quantity
    }
    
    func layoutView() {
        self.addSubview(stack)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(160)
            $0.width.equalTo(390)
        }

        imageView.snp.makeConstraints{
            $0.width.height.equalTo(140)
        }

        HStack.addArrangedSubview(imageView)
        HStack.addArrangedSubview(VStack)

        VStack.addArrangedSubview(titleLabel)
        VStack.addArrangedSubview(descriptionLabel)
        VStack.addArrangedSubview(priceLabel)
        VStack.addArrangedSubview(button)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21-12)
            $0.height.equalTo(18)
        }
        descriptionLabel.snp.makeConstraints { $0.height.equalTo(32) }
//        priceLabel.snp.makeConstraints { $0.height.equalTo(16) }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(166)
            make.height.equalTo(36)
        }

        stack.addArrangedSubview(HStack)

    }
    
    

}


