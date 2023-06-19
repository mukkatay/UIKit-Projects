//
//  ExploreController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

private let reuseIdentifire = "UserCell"

class ExploreController: UITableViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    
    //MARK: - API
    
    func fetchUsers() {
        UserService.shared.fetchUsers { users in
            <#code#>
        }
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifire)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
}

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as! UserCell
        return cell
    }
}
