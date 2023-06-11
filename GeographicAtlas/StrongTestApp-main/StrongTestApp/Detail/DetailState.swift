//
//  DetailState.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import Foundation

struct DetailState {
  var country: Country?
  
  static let initial = DetailState(
    country: nil
  )
  
  func with(country: Country) -> Self {
    DetailState(country: country)
  }
  
}
