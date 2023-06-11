//
//  CollectionHeaderView.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit
import SnapKit

class CollectionHeaderView: UICollectionReusableView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureProperties()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with title: String) {
    titleLabel.text = title
  }
  
  //MARK: Private
  private let titleLabel = UILabel()
  
  private func configureProperties() {
    titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
    titleLabel.textColor = UIColor(red: 171/255, green: 179/255, blue: 187/255, alpha: 1)
  }
  
  private func layout() {
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
}
