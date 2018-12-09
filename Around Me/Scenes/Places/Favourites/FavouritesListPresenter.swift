//
//  FavouritesListPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FavouritesListPresenter: InterfaceFavouritesListPresenter {
    var router: InterfaceFavouritesListRouter?
    var interactor: InterfaceFavouritesListInteractorInput?
    weak var view: InterfaceFavouritesListViewController?
    
}

extension FavouritesListPresenter: InterfaceFavouritesListInteractorOutput {
}
