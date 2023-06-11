//
//  Resources.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 01.06.2023.
//

import UIKit

enum Resources {
    enum Color {
        static var black = UIColor(hexString: "#000000")
        static var gray = UIColor(hexString: "#8E8E93")
        static var grayLight = UIColor(hexString: "#C7C7CC")
        static var grayBackround = UIColor(hexString: "#F6F6F6")
        static var white = UIColor(hexString: "#FFFFFF")
        static var indigo = UIColor(hexString: "#5856D6")
        static var orange = UIColor(hexString: "#FF9500")
        static var yellow = UIColor(hexString: "#FFCC00")
        static var purple = UIColor(hexString: "#AF52DE")
        static var green = UIColor(hexString: "#34C759")
        static var red = UIColor(hexString: "#FF3B30")
    }
    
    enum Images {
        enum TabBar {
            static var catalog = UIImage(named: "House")
            static var cart = UIImage(named: "Cart")
            static var profile = UIImage(named: "Profile")
        }
    }
    
    enum String {
        enum TabBar {
            static var catalog = "Catalog"
            static var cart = "Cart"
            static var profile = "Profile"
        }
    }
}
