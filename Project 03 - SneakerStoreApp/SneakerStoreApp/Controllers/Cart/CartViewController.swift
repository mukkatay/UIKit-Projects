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
    
    var cartItems: [CartItem] = []
    
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
        
        cartItems = CartManager.shared.getCartItems()
        
        func updateCart() {
            cartItems = CartManager.shared.getCartItems()
            collectionView.reloadData()
        }
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
            showBottomSheet()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        [confirmAction, cancelAction].forEach{alertController.addAction($0)}
        
        present(alertController, animated: true)
    }
    
    func showBottomSheet() {
        let vc = BottomSheetController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom{_ in
                return 538
            }]
        }
        present(vc, animated: true)
    }
}

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CartViewCell.self)", for: indexPath) as? CartViewCell else {
            return UICollectionViewCell()
        }
        cell.card = cartItems[indexPath.row]
        return cell
    }
}

