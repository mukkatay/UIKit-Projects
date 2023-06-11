//
//  DetailInteractor.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import UIKit

protocol DetailPresentable: AnyObject {
  func onModelChange(_ state: DetailState)
}

class DetailInteractor: DetailInteractable {
  
  weak var presenter: DetailPresentable?
  
  init(country: Country) {
    self.country = country
  }
  
  func update() {
    state = state.with(country: country)
  }
  
  //MARK: Private
  private let country: Country
  
  private var state = DetailState.initial {
    didSet {
      self.presenter?.onModelChange(state)
    }
  }
}
