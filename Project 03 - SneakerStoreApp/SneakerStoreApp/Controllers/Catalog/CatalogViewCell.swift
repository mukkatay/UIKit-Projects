//
//  CatalogViewCell.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 03.06.2023.
//

import UIKit

protocol CatalogCellDelegate: AnyObject {
    func didSelectAddButton(withText text: String)
}

class CatalogViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let addToCartButton = UIButton()
    
    var card: Product? {
        didSet {
            titleLabel.text = card?.name
            descriptionLabel.text = card?.description
            priceLabel.text = card?.price
            if let image = card?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
    
    weak var delegate: CatalogCellDelegate?

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
        
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.backgroundColor = .black
        addToCartButton.layer.cornerRadius = 20
        addToCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        
        imageView.contentMode = .scaleToFill
    }

    @objc func addToCartButtonTapped() {
        print("Add to card!")
        // Обработка нажатия кнопки "Add to Cart"
        // Добавьте выбранный продукт в корзину
        // Например:
        if let product = card {
            CartManager.shared.addToCart(product)
        }
    }
    
    func layoutView() {
        [imageView, titleLabel, descriptionLabel, priceLabel, addToCartButton].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            imageView.heightAnchor.constraint(equalToConstant: 166),
            imageView.widthAnchor.constraint(equalToConstant: 166),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            addToCartButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            addToCartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            addToCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            addToCartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    
}
