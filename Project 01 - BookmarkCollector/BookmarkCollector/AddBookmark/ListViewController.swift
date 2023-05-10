//
//  ListView.swift
//  BookmarkCollector
//
//  Created by Akyl Mukatay  on 05.05.2023.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: Public
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureProperties()
        configureLayout()
    }
    
    //MARK: Private
    private var tableView = UITableView()
    
    private let titleText: UILabel = {
        let title = UILabel()
        title.text = "Bookmark App"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return title
    }()
    
    private let text: UILabel = {
        let text = UILabel()
        text.text = "Save your first \nbookmark"
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        text.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        text.numberOfLines = 0
        
        return text
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add bookmark", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    private func configureProperties() {
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        
        self.navigationItem.title = Site.sites.isEmpty ? "Bookmark App" : "List"
        
        tableView.isHidden = Site.sites.isEmpty
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SiteCell.self, forCellReuseIdentifier: "SiteCell")
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        
        
        button.addTarget(self, action: #selector(addBookmarkDidTapped), for: .touchUpInside)
    }
    
    private func configureLayout() {
        [titleText, text, button].forEach { UIView in
            view.addSubview(UIView)
        }
        titleText.anchor(
            top: self.view.topAnchor,
            left: self.view.leftAnchor,
            right: self.view.rightAnchor,
            paddingTop: 66,
            paddingLeft: 16,
            paddingRight: 16)
        text.anchor(
            top: titleText.bottomAnchor,
            left: self.view.leftAnchor,
            right: self.view.rightAnchor,
            paddingTop: 288,
            paddingLeft: 16,
            paddingRight: 16
        )
        
        view.addSubview(tableView)
        tableView.fillView(self.view)
        tableView.anchor(
            top: self.view.topAnchor,
            bottom: self.view.bottomAnchor,
            left: self.view.leftAnchor,
            right: self.view.rightAnchor,
            paddingBottom: 128
            
        )
        
        view.addSubview(button)
        button.anchor(
            bottom: self.view.bottomAnchor,
            left: self.view.leftAnchor,
            right: self.view.rightAnchor,
            paddingBottom: 50,
            paddingLeft: 16,
            paddingRight: 16,
            height: 58
        )
    }
    
    @objc private func addBookmarkDidTapped() {
        let alertController = UIAlertController(title: "Change", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Bookmark title"
        }
        alertController.addTextField { UITextField in
            UITextField.placeholder = "Bookmark link"
        }
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self] _ in
            guard let textField1 = alertController.textFields?[0],
                  let textField2 = alertController.textFields?[1] else {
                return
            }
            Site.sites.append(Site(name: String(textField1.text!), link: String(textField2.text!)))
            tableView.isHidden = Site.sites.isEmpty
            self.navigationItem.title = Site.sites.isEmpty ? "Bookmark App" : "List"
            tableView.reloadData()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Site.sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SiteCell", for: indexPath) as? SiteCell else {
            return UITableViewCell()
        }
        cell.configureView(site: Site.sites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}
