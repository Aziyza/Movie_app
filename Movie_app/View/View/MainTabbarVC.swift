//
//  MainTabbarVC.swift
//  Movie_app
//
//  Created by Mac on 9/7/21.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = UITabBarItem()
        item1.image = #imageLiteral(resourceName: "home")
        item1.selectedImage = #imageLiteral(resourceName: "home-fill")
        
        let item2 = UITabBarItem()
        item2.image = #imageLiteral(resourceName: "heart")
        item2.selectedImage = #imageLiteral(resourceName: "heart-fill")
        
        let item3 = UITabBarItem()
        item3.image = #imageLiteral(resourceName: "user")
        item3.selectedImage = #imageLiteral(resourceName: "user-fill")
        
        
        let homeVC = UINavigationController(rootViewController: HomeVC(nibName: "HomeVC", bundle: nil))
        homeVC.tabBarItem = item1
        homeVC.title = "Home"
        
        let favouriteVC = UINavigationController(rootViewController: FavouriteVC(nibName: "FavouriteVC", bundle: nil))
        favouriteVC.tabBarItem = item2
        favouriteVC.title = "Favourites"
        
        let profileVC = UINavigationController(rootViewController: Profile(nibName: "Profile", bundle: nil))
        profileVC.tabBarItem = item3
        profileVC.title = "Profile"
        
        self.tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   //#colorLiteral(red: 0.8666666667, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
        self.tabBar.barTintColor = #colorLiteral(red: 0.05490196078, green: 0.05490196078, blue: 0.05490196078, alpha: 1)
        self.viewControllers = [homeVC, favouriteVC, profileVC]
    }

}
