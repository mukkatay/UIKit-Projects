//
//  NotificationsController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

private let reuseIdentifire = "NotificationCell"

class NotificationsController: UITableViewController {
    
    //MARK: - Properties
    
    private var notification = [Notification]()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifations"
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifire)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
}

extension NotificationsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as! NotificationCell
        return cell
    }
}
