//
//  DetailLabelView.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import UIKit
import SnapKit

class DetailLabelView: UIView {
  
  func set(title: String, label: String) {
    self.title.text = title
    self.label.text = label
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureProperties()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let stack = UIStackView()
  private let vStack = UIStackView()
  
  private let dotView = UIImageView()
  private let title = UILabel()
  private let label = UILabel()
  
  private func configureProperties() {
   
    stack.axis = .horizontal
    stack.spacing = 8
    
    vStack.axis = .vertical
    vStack.spacing = 4
    
    dotView.contentMode = .scaleAspectFit
    dotView.tintColor = .label
    dotView.image = UIImage(systemName: "circle.fill")
    
    title.font = .systemFont(ofSize: 15)
    title.textColor = .secondaryLabel
    
    label.font = .systemFont(ofSize: 20)

  }
  
  private func layout() {
    addSubview(stack)
    stack.snp.makeConstraints { $0.edges.equalToSuperview() }
    
    vStack.addArrangedSubview(title)
    vStack.addArrangedSubview(label)
    
    stack.addArrangedSubview(dotView)
    dotView.snp.makeConstraints { $0.width.equalTo(10) }
    
    stack.addArrangedSubview(vStack)
    
  }
}
