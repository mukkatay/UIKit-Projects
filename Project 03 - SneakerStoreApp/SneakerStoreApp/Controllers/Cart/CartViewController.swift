//
//  CartViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit
import SnapKit

class CartViewController: UIViewController {
    var collectionView: UICollectionView!
    var totalView = UIView()
    var button = UIButton()
    
    var itemCardArray: [Card] = {
        var sneaker1 = Card()
        sneaker1.titleLabel = "New Balance"
        sneaker1.descriptionLabel = "Кроссовки 993 Brown из коллаборации с Aimé Leon Dore"
        sneaker1.priceLabel = "$325"
        sneaker1.imageName = "Img5"
        
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

        return [sneaker1, sneaker4]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Color.grayBackround
        
        title = "Cart"
        navigationController?.tabBarItem.title = Resources.String.TabBar.cart
        
        layoutView()
        configure()
    }
    
    func configure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CartViewCell.self, forCellWithReuseIdentifier: "\(CartViewCell.self)")
        collectionView.backgroundColor = Resources.Color.grayBackround
        
        totalView.backgroundColor = .white
        
        button.setTitle("Confirm Order", for: .normal)
        button.backgroundColor = Resources.Color.black
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(triggerAlertAction), for: .touchUpInside)
        
    }
    
    func layoutView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
//        view.addSubview(totalView)
//        totalView.snp.makeConstraints { make in
//            make.left.right.equalToSuperview()
//            make.height.equalTo(50)
//        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(13)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = .init(width: view.frame.size.width, height: 0)
        layout.footerReferenceSize = .init(width: view.frame.size.width, height: 70)
        return layout
    }
    
    @objc func triggerAlertAction() {
        showAlert()
    }
    
}

extension CartViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Proceed with payment", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
            showActionSheet()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        [confirmAction, cancelAction].forEach{alertController.addAction($0)}
        
        present(alertController, animated: true)
    }
    
    func showActionSheet() {
        print("Bottom sheet is activated")
    }
}

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CartViewCell.self)", for: indexPath) as? CartViewCell else {
            return UICollectionViewCell()
        }
        cell.card = itemCardArray[indexPath.row]
        return cell
    }
}
