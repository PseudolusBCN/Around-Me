//
//  MainBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainBuilder: BaseBuilder {
    func main() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor(delegate: presenter)
        let router = MainRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
