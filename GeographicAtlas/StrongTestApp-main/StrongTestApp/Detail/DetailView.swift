//
//  DetailView.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

class DetailView: UIView {
  
  func set(with content: Country) {
    if let url = URL(string: content.flag) {
      flagImage.kf.setImage(with: url)
    } else {
      flagImage.image = UIImage(named: content.flag)
    }
    
    regionLabel.set(title: "Region:", label: content.region)
    capitalLabel.set(title: "Capital:", label: content.capital)
    capitalCoordLabel.set(title: "Capital coordination:", label: content.capitalCoord)
    populationLabel.set(title: "Population:", label: content.population)
    areaLabel.set(title: "Area:", label: content.area)
    currencyLabel.set(title: "Currencies:", label: content.currencies)
    timezoneLabel.set(title: "Timezones:", label: content.timezone)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureProperties()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private
  private let scrollView = VerticalScrollFactory()
  
  private let flagImage = UIImageView()
  
  private let regionLabel = DetailLabelView()
  
  private let capitalLabel = DetailLabelView()
  
  private let capitalCoordLabel = DetailLabelView()
  
  private let populationLabel = DetailLabelView()
  
  private let areaLabel = DetailLabelView()
  
  private let currencyLabel = DetailLabelView()
  
  private let timezoneLabel = DetailLabelView()
  
  private func configureProperties() {
    backgroundColor = .systemBackground
    
    scrollView.contentView.spacing = 20.57
    scrollView.contentView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    flagImage.contentMode = .scaleAspectFit
    flagImage.layer.cornerRadius = 8
    flagImage.clipsToBounds = true
  }
  
  private func layout() {
    scrollView.addScrollView(to: self)
    scrollView.contentView.addArrangedSubview(flagImage)
    scrollView.contentView.addArrangedSubview(regionLabel)
    scrollView.contentView.addArrangedSubview(capitalLabel)
    scrollView.contentView.addArrangedSubview(capitalCoordLabel)
    scrollView.contentView.addArrangedSubview(populationLabel)
    scrollView.contentView.addArrangedSubview(areaLabel)
    scrollView.contentView.addArrangedSubview(currencyLabel)
    scrollView.contentView.addArrangedSubview(timezoneLabel)
    flagImage.snp.makeConstraints {
      $0.height.equalTo(200)
    }
  }
}
