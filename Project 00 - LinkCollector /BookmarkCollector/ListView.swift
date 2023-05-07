//
//  ListView.swift
//  BookmarkCollector
//
//  Created by Akyl Mukatay  on 05.05.2023.
//

import UIKit

struct Site {
    var name: String
    var link: String
}

extension Site {
    static var sites: [Site] = []
}

class ListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView = {
       let tableView = UITableView()
        return tableView
        
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        
        if Site.sites.isEmpty {
            configureEmptyListSubviews()
        } else {
            configureListSubview()
        }
        
        button.anchor(bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingBottom: 50, paddingLeft: 16, paddingRight: 16, height: 58)
        
        configureAlertController()
    }
    
    override func loadView() {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        view = bgView
    }
    
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
    
    public func configureEmptyListSubviews() {
        [titleText, text, button].forEach { UIView in
            view.addSubview(UIView)
        }
        
        titleText.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 66, paddingLeft: 16, paddingRight: 16)
        text.anchor(top: titleText.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 288, paddingLeft: 16, paddingRight: 16)
        
    }
    
    public func configureListSubview() {
        self.navigationItem.title = "List"
        
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.fillView(self.view)
        tableView.register(SiteCell.self, forCellReuseIdentifier: "SiteCell")
        tableView.anchor(top: self.view.topAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingBottom: 128)
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        
        view.addSubview(button)
    }
    
    private func configureAlertController() {
        button.addAction(UIAction(title: "OK", handler: { _ in
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
                tableView.reloadData()
            }))
            self.present(alertController, animated: true, completion: nil)
        }), for: .touchUpInside)
    }
    
    
}


class SiteCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let linkIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "golink"))
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(site: Site) {
        self.nameLabel.text = site.name
    }
    
    private func setUI() {
        self.backgroundColor =  UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        [nameLabel, linkIcon].forEach{ self.addSubview($0) }
        
        nameLabel.anchor(bottom: self.bottomAnchor, left: self.leftAnchor, paddingBottom: 19, paddingLeft: 16)
        linkIcon.anchor(bottom: self.bottomAnchor, right: self.rightAnchor, paddingBottom: 19, paddingRight: 19)
    }
}
