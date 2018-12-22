//
//  FavouritesListBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FavouritesListBuilder: BaseBuilder {
    func main() -> UIViewController {
        let view = FavouritesListViewController()
        let presenter = FavouritesListPresenter(delegate: view)
        let interactor = FavouritesListInteractor(delegate: presenter)
        let router = FavouritesListRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
