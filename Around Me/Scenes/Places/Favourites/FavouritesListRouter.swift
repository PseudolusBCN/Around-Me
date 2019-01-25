//
//  FavouritesListRouter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FavouritesListRouter: InterfaceFavouritesListRouter {
    weak var presenter: InterfaceFavouritesListPresenter?
    weak var view: UIViewController?

    func gotoFiltersScene() {
        let viewController = FiltersBuilder().main(.favourites, selectionMode: .multiple, reloadDataAfterFilterChange: .no)
        view?.navigationController?.present(viewController, animated: true)
    }
}
