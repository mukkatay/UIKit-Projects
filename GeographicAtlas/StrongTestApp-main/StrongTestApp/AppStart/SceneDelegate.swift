//
//  SceneDelegate.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    vc = MainViewController()
    model = MainInteractor()
    model?.presenter = vc
    vc?.interactor = model
    guard let vc else { return }
    window?.rootViewController = UINavigationController(rootViewController: vc)
    window?.makeKeyAndVisible()
    
    model?.getCountries()
  }
  
  private var vc: MainViewController?
  private var model: MainInteractor?

}

