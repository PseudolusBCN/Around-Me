//
//  PlacesListRouter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListRouter: InterfacePlacesListRouter {
    weak var presenter: InterfacePlacesListPresenter?
    weak var view: UIViewController?

    func gotoFiltersScene() {
        let viewController = FiltersBuilder().main(.list, selectionMode: .single, reloadDataAfterFilterChange: .yes)
        view?.navigationController?.present(viewController, animated: true)
    }
}
