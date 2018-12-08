//
//  TabBarViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        configTabBar()
    }

    private func configTabBar() {
        let listViewController = PlacesListViewController()
        let favouritesViewController = FavouritesListViewController()
        let settingsViewController = SettingsViewController()
        
        listViewController.tabBarItem = UITabBarItem(title: "main.tabBar.list".localized, image: UIImage(), tag: 0)
        favouritesViewController.tabBarItem = UITabBarItem(title: "main.tabBar.favourites".localized, image: UIImage(), tag: 1)
        settingsViewController.tabBarItem = UITabBarItem(title: "main.tabBar.settings".localized, image: UIImage(), tag: 2)

        let tabBarList = [listViewController, favouritesViewController, settingsViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
