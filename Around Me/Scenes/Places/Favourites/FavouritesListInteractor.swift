//
//  FavouritesListInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FavouritesListInteractor: InterfaceFavouritesListInteractor {
    weak var presenter: InterfaceFavouritesListPresenter?
    
    unowned var delegate: InterfaceFavouritesListInteractorOutput
    
    init(delegate: InterfaceFavouritesListInteractorOutput) {
        self.delegate = delegate
    }
}
