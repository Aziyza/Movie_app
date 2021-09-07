//
//  AppDelegate.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        
        let tabbar = MainTabbarVC()
        
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
        
        return true
    }

    
}

