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
        item1.image = #imageLiteral(resourceName: "popular")
        item1.title = "Popular"
        
        let item2 = UITabBarItem()
        item2.image = #imageLiteral(resourceName: "top-rated")
        item2.title = "Top rated"
        
        let item3 = UITabBarItem()
        item3.image = #imageLiteral(resourceName: "new")
        item3.title = "Upcoming"
        
        
        let popularVC = UINavigationController(rootViewController: PopularVC(nibName: "PopularVC", bundle: nil))
        popularVC.tabBarItem = item1
        
        let topratedVC = UINavigationController(rootViewController: TopRatedVC(nibName: "TopRatedVC", bundle: nil))
        topratedVC.tabBarItem = item2
        
        let upcomingVC = UINavigationController(rootViewController: Upcoming(nibName: "Upcoming", bundle: nil))
        upcomingVC.tabBarItem = item3
        self.tabBar.tintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        self.viewControllers = [popularVC, topratedVC, upcomingVC]
    }

}
