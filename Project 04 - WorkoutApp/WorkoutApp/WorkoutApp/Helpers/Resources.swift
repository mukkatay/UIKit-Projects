//
//  Resources.swift
//  WorkoutApp
//
//  Created by Akyl Mukatay  on 09.05.2023.
//

import UIKit

enum Resources {
    enum Color {
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var backgrond = UIColor(hexString: "#F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var secondary = UIColor(hexString: "F0F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
        
        enum Overview {
            static var navBar = "Today"
            static var allWorkoutButton = "All Workouts"
        }
        
        enum Session {
            static var navBarLeft = "Pause"
            static var navBarRight = "Finish"
        }
        
        enum Progress {
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
        }
        
        enum Settings {
            
        }
        
        
    }
    
    enum Images {
        
        enum TabBar {
            static var overview = UIImage(named: "House-Icon")
            static var session = UIImage(named: "Clock-Icon")
            static var progress = UIImage(named: "Analytics-Bars")
            static var settings = UIImage(named: "Gear-Icon")
        }
        
        enum Common {
            static var downArrow = UIImage(named: "Down-Arrow")
            static var add = UIImage(named: "Add")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
