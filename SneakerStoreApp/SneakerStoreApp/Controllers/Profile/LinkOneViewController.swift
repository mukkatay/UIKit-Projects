//
//  LinkOneViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 07.06.2023.
//

import UIKit
import WebKit

class LinkOneViewController: UIViewController {
    
    let webView = WKWebView()
    let activitiIndecatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "How to know your shoe size?"
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor.black
        }
    
        configureActivitiIndecator()
        configureWebview()
        loadRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.activitiIndecatorView.stopAnimating()
        }
    }
    
    func configureActivitiIndecator() {
        webView.addSubview(activitiIndecatorView)
        activitiIndecatorView.center = view.center
        activitiIndecatorView.color = .darkGray
        activitiIndecatorView.startAnimating()
        activitiIndecatorView.hidesWhenStopped = true
    }
    
    func configureWebview() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func loadRequest() {
        guard let url = URL(string: "https://www.kohls.com/feature/shoesizeguide.jsp") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}
