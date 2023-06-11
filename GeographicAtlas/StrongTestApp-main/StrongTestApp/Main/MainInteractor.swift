//
//  MainInteractor.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 16.05.2023.
//

import Foundation

protocol MainPresentable: AnyObject {
  func onModelChange(_ state: MainState)
  func startLoading()
  func stopLoading()
}

class MainInteractor: MainInteractable {
  
  weak var presenter: MainPresentable?
  
  func selected(indexPath: IndexPath) {
    state.countriesSection[indexPath.section].items[indexPath.row].isSelected.toggle()
  }
  
  func getCountries() {
    presenter?.startLoading()
    APIManager.shared.getCountries {[weak self] (response) in
      guard let self else { return }
      self.presenter?.stopLoading()
      switch response {
      case .success(let countries):
        self.mapCountries(countries: countries)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func mapCountries(countries: [CountryResponse]) {
    var data: [CountriesSection] = []
    var regions = Set<String>()
    let items = countries.map {
      regions.insert($0.getMappedCountry().region)
      return $0.getMappedCountry().country
    }
 
    regions.forEach { region in
      var newCountries: [Country] = []
      items.forEach { country in
        if country.region == region {
          newCountries.append(country)
        }
      }
      
      data.append(CountriesSection(headerTitle: region, items: newCountries))
    }
    state = state.with(countriesSection: data)
  }
  
  //MARK: Private
  private var state = MainState.initial {
    didSet {
      self.presenter?.onModelChange(state)
    }
  }
}
