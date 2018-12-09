//
//  FavouritesListViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class FavouritesListViewController: BaseViewController, InterfaceFavouritesListViewController {
    var presenter: InterfaceFavouritesListPresenter?
    
    init() {
        super.init(nibName: "FavouritesListViewController", bundle: nil)

        setNavBarTitle("main.appName".localized)
        tabBarItem.title = "main.tabBar.favourites".localized
        tabBarItem.image = UIImage(named:"IcoFavourites")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
