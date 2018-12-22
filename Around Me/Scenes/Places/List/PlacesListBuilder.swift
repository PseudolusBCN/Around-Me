//
//  PlacesListBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListBuilder: BaseBuilder {
    func main() -> UIViewController {
        let view = PlacesListViewController()
        let presenter = PlacesListPresenter(delegate: view)
        let interactor = PlacesListInteractor(delegate: presenter)
        let router = PlacesListRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.presenter = presenter
        router.view = view
        
        return UINavigationController(rootViewController: view)
    }
}
