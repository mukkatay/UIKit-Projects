//
//  Cells.swift
//  BookmarkCollector
//
//  Created by Akyl Mukatay  on 07.05.2023.
//

import UIKit

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
        
        nameLabel.anchor(
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            paddingBottom: 19,
            paddingLeft: 16
        )
        
        linkIcon.anchor(
            bottom: self.bottomAnchor,
            right: self.rightAnchor,
            paddingBottom: 19,
            paddingRight: 19
        )
    }
}
