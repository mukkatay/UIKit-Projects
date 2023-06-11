//
//  LinkTwoViewController.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 07.06.2023.
//

import UIKit
import WebKit

class LinkTwoViewController: UIViewController {
    
    let webView = WKWebView()
    let activitiIndecatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Check the authenticity of the shoe"
        
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
        guard let url = URL(string: "https://hypestew.com/blogs/news/legit-check") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}

