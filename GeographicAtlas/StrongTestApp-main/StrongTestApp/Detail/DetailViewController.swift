//
//  DetailViewController.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import UIKit

protocol DetailInteractable: AnyObject {
  func update()
}

class DetailViewController: BaseViewController<DetailView> {
  
  weak var interactor: DetailInteractable?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor?.update()
  }
}

extension DetailViewController: DetailPresentable {
  func onModelChange(_ state: DetailState) {
    guard let country = state.country else { return }
    rootView?.set(with: country)
    title = country.name
  }
}
