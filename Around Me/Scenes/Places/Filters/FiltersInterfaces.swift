//
//  FiltersInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceFiltersViewController: class {
    var presenter: InterfaceFiltersPresenter? { get set }
}

protocol InterfaceFiltersPresenter: class {
    var router: InterfaceFiltersRouter? { get set }
    var interactor: InterfaceFiltersInteractor? { get set }
    var view: InterfaceFiltersViewController? { get set }
    
    func closeView()
}

protocol InterfaceFiltersPresenterOutput: class {
}

protocol InterfaceFiltersInteractor: class {
    var presenter: InterfaceFiltersPresenter? { get set }
}

protocol InterfaceFiltersInteractorOutput: class {
}

protocol InterfaceFiltersRouter: class {
    var presenter: InterfaceFiltersPresenter? { get set }
    
    func returnToOriginScene()
}
