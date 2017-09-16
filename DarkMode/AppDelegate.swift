//
//  AppDelegate.swift
//  DarkMode
//
//  Created by Andrew on 2017-09-15.
//  Copyright © 2017 Walzy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.black
        window?.makeKeyAndVisible()
                
        let newVC = ViewController()
        let navVC = UINavigationController(rootViewController: newVC)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        return true
    }
    
    public func setStatusBar() {
        if isDarkMode == true {
            UIApplication.shared.statusBarStyle = .lightContent
        } else {
            UIApplication.shared.statusBarStyle = .default
        }
    }
}

