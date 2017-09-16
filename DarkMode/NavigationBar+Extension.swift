//
//  NavigationBar+Extension.swift
//  DarkMode
//
//  Created by Andrew on 2017-09-15.
//  Copyright © 2017 Walzy. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func setTheme() {
        if isDarkMode == true {
            UIApplication.shared.statusBarStyle = .lightContent
        } else {
            UIApplication.shared.statusBarStyle = .default
        }
        barTintColor        = Palette.secondaryBackgroundColor
        tintColor           = Palette.accentColor
        titleTextAttributes = [NSAttributedStringKey.foregroundColor: Palette.accentColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20.0)]
        
        if #available(iOS 11.0, *) {
            largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: Palette.accentColor]
            prefersLargeTitles = true
        }
    }
}
