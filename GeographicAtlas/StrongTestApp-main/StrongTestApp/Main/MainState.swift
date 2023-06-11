//
//  MainState.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import Foundation

struct MainState {
  var countriesSection: [CountriesSection]
  
  static let initial = MainState(
    countriesSection: []
  )
  
  func with(countriesSection: [CountriesSection]) -> Self {
    MainState(countriesSection: countriesSection)
  }
  
}

