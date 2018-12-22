//
//  TabBarBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class TabBarBuilder: BaseBuilder {
    func main() -> UIViewController {
        let modules: [BaseBuilder] = [PlacesListBuilder(), FavouritesListBuilder(), SettingsBuilder()]
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = modules.map { $0.main() }
        return tabbarController
    }
}
