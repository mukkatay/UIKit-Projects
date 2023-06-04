//
//  CatalogCard.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit
import SnapKit

class CatalogCard: UIView {
    
    var image = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        [image, titleLabel, descriptionLabel, priceLabel, button].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            button.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func configure() {
        image = UIImageView(image: UIImage(named: "Img1"))
        
        titleLabel.text = "Dolce & Gabbana"
        titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        
        descriptionLabel.text = "Кеды с принтом граффити"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = Resources.Color.gray
        
        priceLabel.text = "$1251"
        priceLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        button.setTitle("Add to card", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}
