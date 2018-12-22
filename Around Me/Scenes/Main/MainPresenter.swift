//
//  MainPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainPresenter: InterfaceMainPresenter {
    var router: InterfaceMainRouter?
    var interactor: InterfaceMainInteractor?
    weak var view: InterfaceMainViewController?
    
    // MARK: - Public methods
    func setupObservers() {
        interactor?.setupObservers()
    }
    
    func removeObservers() {
        interactor?.removeObservers()
    }
}

extension MainPresenter: InterfaceMainInteractorOutput {
    func gotoMainScene() {
        router?.gotoMainScene()
    }
}
