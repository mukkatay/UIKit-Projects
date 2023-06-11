//
//  MainViewController.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit
import SnapKit

protocol MainInteractable: AnyObject {
    func selected(indexPath: IndexPath)
}


class MainViewController: BaseViewController<MainView> {
    
    weak var interactor: MainInteractable?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "World countries"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView?.delegate = self
        
        layout()
        
        ai.hidesWhenStopped = true
    }
    
    func startLoading() {
        ai.startAnimating()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.ai.stopAnimating()
        }
    }
    
    private func routeToDetail(country: Country) {
        detailVC = DetailViewController()
        detailModel = DetailInteractor(country: country)
        detailModel?.presenter = detailVC
        detailVC?.interactor = detailModel
        guard let detailVC else { return }
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private var detailVC: DetailViewController?
    private var detailModel: DetailInteractor?
    
    private let ai = UIActivityIndicatorView(style: .medium)
    
    
    private func layout() {
        rootView?.addSubview(ai)
        ai.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension MainViewController: MainViewDelegate, MainPresentable {
    func onViewEvent(_ event: MainViewEvent) {
        switch event {
        case .selected(let indexPath):
            interactor?.selected(indexPath: indexPath)
        case .open(let country):
            routeToDetail(country: country)
        }
    }
    
    func onModelChange(_ state: MainState) {
        rootView?.applySnapshot(sections: state.countriesSection)
    }
}
