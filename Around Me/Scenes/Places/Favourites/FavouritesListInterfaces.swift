//
//  FavouritesListInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceFavouritesListViewController: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
}

protocol InterfaceFavouritesListPresenter: class {
    var router: InterfaceFavouritesListRouter? { get set }
    var interactor: InterfaceFavouritesListInteractorInput? { get set }
    var view: InterfaceFavouritesListViewController? { get set }
}

protocol InterfaceFavouritesListInteractorInput: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
}

protocol InterfaceFavouritesListInteractorOutput: class {
}

protocol InterfaceFavouritesListRouter: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
}
