//
//  CatalogViewCell.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 03.06.2023.
//

import UIKit

class CatalogViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let button = UIButton()
    
    var card: Card? {
        didSet {
            titleLabel.text = card?.titleLabel
            descriptionLabel.text = card?.descriptionLabel
            priceLabel.text = card?.priceLabel
            if let image = card?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        
        titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = Resources.Color.gray
        
        priceLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        button.setTitle("Add to card", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    
    func layoutView() {
        [imageView, titleLabel, descriptionLabel, priceLabel, button].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            button.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
