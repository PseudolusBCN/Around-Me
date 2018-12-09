//
//  SettingsBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class SettingsBuilder: BaseBuilder {
    func main() -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor(delegate: presenter)
        let router = SettingsRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
