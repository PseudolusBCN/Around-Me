//
//  FiltersBuilder.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

enum FilterSelectionMode {
    case single
    case multiple
}

enum ReloadDataAfterFilterChange {
    case yes
    case no
}

class FiltersBuilder {
    func main(_ type: FilterType, selectionMode: FilterSelectionMode, reloadDataAfterFilterChange: ReloadDataAfterFilterChange) -> UIViewController {
        let view = FiltersViewController()
        let presenter = FiltersPresenter(delegate: view)
        let interactor = FiltersInteractor(delegate: presenter, filterType: type, filterSelectionMode: selectionMode, reloadDataAfterFilterChange: reloadDataAfterFilterChange)
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
