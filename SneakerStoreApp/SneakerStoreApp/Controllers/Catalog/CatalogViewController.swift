//
//  CatalogViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

class CatalogViewController: UIViewController {
    var collectionView: UICollectionView!

    var itemCardArray: [Product] = createProducts()
    
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
        collectionView.reloadData()
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
