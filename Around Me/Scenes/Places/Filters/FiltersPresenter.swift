//
//  FiltersPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersPresenter: InterfaceFiltersPresenter {
    var router: InterfaceFiltersRouter?
    var interactor: InterfaceFiltersInteractor?
    weak var view: InterfaceFiltersViewController?
    
    unowned var delegate: InterfaceFiltersPresenterOutput
    
    // MARK: - Init
    init(delegate: InterfaceFiltersPresenterOutput) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    func closeView() {
        router?.returnToOriginScene()
    }
}

extension FiltersPresenter: InterfaceFiltersInteractorOutput {
}
