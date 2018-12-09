//
//  SettingsViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class SettingsViewController: BaseViewController, InterfaceSettingsViewController {
    var presenter: InterfaceSettingsPresenter?
    
    init() {
        super.init(nibName: "SettingsViewController", bundle: nil)
        
        setNavBarTitle("main.appName".localized)
        tabBarItem.title = "main.tabBar.settings".localized
        tabBarItem.image = UIImage(named:"IcoSettings")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
