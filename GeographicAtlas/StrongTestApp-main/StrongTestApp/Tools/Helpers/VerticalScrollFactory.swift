//
//  VerticalScrollFactory.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit

class VerticalScrollFactory {
  let contentView: UIStackView = {
    let stack = UIStackView()
    stack.isLayoutMarginsRelativeArrangement = true
    stack.axis = .vertical
    return stack
  }()

  func addScrollView(to view: UIView) {
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  let scrollView = UIScrollView()
  
  init() {
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints {
      $0.edges.equalTo(scrollView)
      $0.width.equalTo(scrollView.snp.width)
    }
    
    scrollView.alwaysBounceVertical = true
  }
}
