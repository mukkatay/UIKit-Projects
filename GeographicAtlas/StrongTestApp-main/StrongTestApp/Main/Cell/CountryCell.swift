//
//  CountryCell.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit
import SnapKit

class CountryCell: UICollectionViewCell {
  
  var didTapped: () -> Void = { }
  var didOpen: () -> Void = { }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureProperties()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with item: Country) {
    bottomIsHidden = !item.isSelected
    
    if let url = URL(string: item.flag) {
      flagImage.kf.setImage(with: url)
    } else {
      flagImage.image = UIImage(named: item.flag)
    }
    nameLabel.text = item.name
    capitalLabel.text = item.capital
      capitalLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
    popLabel.text = "Population: \(item.population)"
    areaLabel.text = "Area: \(item.area)"
    currLabel.text = "Currencies: \(item.currencies)"
  }
  
  //MARK: Private
  private let stack = UIStackView()
  private let topHStack = UIStackView()
  private let topVStack = UIStackView()
  
  private let flagImage = UIImageView()
  private let nameLabel = UILabel()
  private let capitalLabel = UILabel()
  private let rightIcon = UIImageView()
  private let popLabel = UILabel()
  private let areaLabel = UILabel()
  private let currLabel = UILabel()
  private let learnMoreButton = UIButton()
  
  private var bottomIsHidden = true {
    didSet {
      rightIcon.image = self.bottomIsHidden ? UIImage(systemName: "chevron.down") : UIImage(systemName: "chevron.up")
      self.popLabel.isHidden =  self.bottomIsHidden
      self.areaLabel.isHidden =  self.bottomIsHidden
      self.currLabel.isHidden =  self.bottomIsHidden
      self.learnMoreButton.isHidden =  self.bottomIsHidden
    }
  }

  
  private func configureProperties() {
    backgroundColor = UIColor(named: "countryBG")
    layer.cornerRadius = 12
    clipsToBounds = true
    
    stack.axis = .vertical
    stack.spacing = 12
    stack.isLayoutMarginsRelativeArrangement = true
    stack.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    
    topHStack.axis = .horizontal
    topHStack.spacing = 12
    
    topVStack.axis = .vertical
    topVStack.spacing = 4
    
    flagImage.contentMode = .scaleToFill
    flagImage.layer.cornerRadius = 8
    flagImage.clipsToBounds = true
    
    nameLabel.font = .systemFont(ofSize: 17, weight: .bold)
    
    capitalLabel.font = .systemFont(ofSize: 13)
    
    rightIcon.contentMode = .scaleAspectFit
    rightIcon.image = UIImage(systemName: "chevron.down")
    rightIcon.tintColor = .label
    
    popLabel.font = .systemFont(ofSize: 15)
    areaLabel.font = .systemFont(ofSize: 15)
    currLabel.font = .systemFont(ofSize: 15)
    
    learnMoreButton.setTitle("Learn more", for: .normal)
    learnMoreButton.setTitleColor(.link, for: .normal)
    learnMoreButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    learnMoreButton.addTarget(self, action: #selector(didLearnMore), for: .touchUpInside)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
    topHStack.addGestureRecognizer(tap)
  }
  
  private func layout() {
    addSubview(stack)
    stack.snp.makeConstraints { $0.edges.equalToSuperview() }
    
    topVStack.addArrangedSubview(nameLabel)
    topVStack.addArrangedSubview(capitalLabel)
    
    topHStack.addArrangedSubview(flagImage)
    topHStack.addArrangedSubview(topVStack)
    topHStack.addArrangedSubview(rightIcon)
    
    flagImage.snp.makeConstraints {
      $0.width.equalTo(82)
      $0.height.equalTo(48)
    }
    
    rightIcon.snp.makeConstraints { $0.width.equalTo(24) }
    
    stack.addArrangedSubview(topHStack)
    stack.addArrangedSubview(popLabel)
    stack.addArrangedSubview(areaLabel)
    stack.addArrangedSubview(currLabel)
    stack.addArrangedSubview(learnMoreButton)
    
    learnMoreButton.snp.makeConstraints{ $0.height.equalTo(50) }
  }
  
  @objc private func didTap() {
    didTapped()
  }
  
  @objc private func didLearnMore() {
    didOpen()
  }
}
