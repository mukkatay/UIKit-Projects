//
//  APIManager.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 17.05.2023.
//

import Foundation

class APIManager {
  static let shared = APIManager()
  
  let urlString = "https://restcountries.com/v3.1/all"
  
  func getCountries(completion: @escaping (Result<[CountryResponse], Error>) -> Void) {
    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      guard let data else { return }
      do {
        let countries = try JSONDecoder().decode([CountryResponse].self, from: data)
        completion(.success(countries))
      } catch {
        print(error.localizedDescription)
      }
    }
    task.resume()
  }
  
}

