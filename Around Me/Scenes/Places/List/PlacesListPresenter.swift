//
//  PlacesListPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListPresenter: InterfacePlacesListPresenter {
    var router: InterfacePlacesListRouter?
    var interactor: InterfacePlacesListInteractorInput?
    weak var view: InterfacePlacesListViewController?

}

extension PlacesListPresenter: InterfacePlacesListInteractorOutput {
}
