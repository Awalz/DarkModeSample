//
//  Palette.swift
//  DarkMode
//
//  Created by Andrew on 2017-09-15.
//  Copyright © 2017 Walzy. All rights reserved.
//

import UIKit


var isDarkMode: Bool {
    get {
        return UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "isDarkMode")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "colorUpdated"), object: nil, userInfo: nil)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.setStatusBar()
        }
    }
}

struct Palette {
    static public var fontWeight: UIFont.Weight {
        if isDarkMode == false {
            return .regular
        } else {
            return .semibold
        }
    }
    
    static public var backgroundColor: UIColor {
        if isDarkMode == false {
            return UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        } else {
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
    }
    
    static public var secondaryBackgroundColor: UIColor {
        if isDarkMode == false {
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        } else {
            return UIColor(red: 19/255, green: 19/255, blue: 19/255, alpha: 1.0)
        }
    }
    
    static public var textColor: UIColor {
        if isDarkMode == false {
            return UIColor(red: 123/255, green: 123/255, blue: 130/255, alpha: 1.0)
        } else {
            return UIColor(red: 119/255, green: 119/255, blue: 125/255, alpha: 1.0)
        }
    }
    
    static public var accentColor: UIColor {
        if isDarkMode == false {
            return UIColor(red: 0/255, green: 104/255, blue: 222/255, alpha: 1.0)
        } else {
            return UIColor(red: 0/255, green: 191/255, blue: 192/255, alpha: 1.0)
        }
    }
}

