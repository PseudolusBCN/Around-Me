//
//  FiltersBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersBuilder: BaseBuilder {
    func main() -> UIViewController {
        let view = FiltersViewController()
        let presenter = FiltersPresenter(delegate: view)
        let interactor = FiltersInteractor(delegate: presenter)
        let router = FiltersRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
