//
//  MainBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainBuilder {
    func main() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
