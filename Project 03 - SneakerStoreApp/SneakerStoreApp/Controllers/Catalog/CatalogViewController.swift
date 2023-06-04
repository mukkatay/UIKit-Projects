//
//  CatalogViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

class CatalogViewController: UIViewController {
    var collectionView: UICollectionView!
    
    var itemCardArray: [Card] = {
        var sneaker1 = Card()
        sneaker1.titleLabel = "Dolce & Gabbana"
        sneaker1.descriptionLabel = "Кеды с принтом граффити"
        sneaker1.priceLabel = "$1251"
        sneaker1.imageName = "Img1"
        
        var sneaker2 = Card()
        sneaker2.titleLabel = "Off-White"
        sneaker2.descriptionLabel = "Кроссовки Off-Court 3.0"
        sneaker2.priceLabel = "$551"
        sneaker2.imageName = "Img2"
        
        var sneaker3 = Card()
        sneaker3.titleLabel = "Jordan"
        sneaker3.descriptionLabel = "Кеды с принтом граффити"
        sneaker3.priceLabel = "$1251"
        sneaker3.imageName = "Img3"
        
        var sneaker4 = Card()
        sneaker4.titleLabel = "Jordan"
        sneaker4.descriptionLabel = "Кеды с принтом граффити"
        sneaker4.priceLabel = "$1251"
        sneaker4.imageName = "Img4"

        return [sneaker1, sneaker2, sneaker3, sneaker4, sneaker2, sneaker1]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Color.grayBackround
        
        title = "Hello, Sneakerhead!"
        navigationController?.tabBarItem.title = Resources.String.TabBar.catalog
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        collectionView.backgroundColor = Resources.Color.grayBackround
        collectionView.dataSource = self
        collectionView.register(CatalogViewCell.self, forCellWithReuseIdentifier: "cardCell")
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: 100, height: 100)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.headerReferenceSize = .init(width: view.frame.size.width, height: 10)
        layout.footerReferenceSize = .init(width: view.frame.size.width, height: 20)
        
        return layout
    }
}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CatalogViewCell else {
            return UICollectionViewCell()
        }
        cell.card = itemCardArray[indexPath.row]
        return cell
    }
}
