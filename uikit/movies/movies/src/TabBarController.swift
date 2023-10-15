//
//  TabBarController.swift
//  movies
//
//  Created by Ignácio Júnior on 15/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupTabs()
    }

    private func setupTabs(){
        let home = self.createTabBar(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
        let search = self.createTabBar(with: "Search", and: UIImage(systemName: "magnifyingglass"), vc: SearchViewController())
        let history = self.createTabBar(with: "History", and: UIImage(systemName: "clock"), vc: HistoryViewController())
        let account = self.createTabBar(with: "Account", and: UIImage(systemName: "person"), vc: AccountViewController())
        self.setViewControllers([ home, search, history, account ], animated: true)
        self.tabBarController?.selectedViewController  = home
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .black
        
    }
    
    private func createTabBar(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
    
        let navi = UINavigationController(rootViewController: vc)
        navi.tabBarItem.image = image
        navi.viewControllers.first?.navigationItem.title = title
        
        return navi
    }
    
    
}
