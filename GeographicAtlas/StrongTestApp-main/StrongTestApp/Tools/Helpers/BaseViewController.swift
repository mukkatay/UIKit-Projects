//
//  BaseViewController.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
  var rootView: View? { view as? View }
  
  override func loadView() {
    view = View.loadView()
  }
}

extension UIView {
  static func loadView() -> Self {
    return self.init(frame: UIScreen.main.bounds)
  }
  
  static func loadViewZeroFrame() -> Self {
    return self.init(frame: .zero)
  }
}
