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
    var interactor: InterfaceMainInteractorInput?
    weak var view: InterfaceMainViewController?
    
    func setupObservers() {
        interactor?.setupObservers()
    }
    
    func removeObservers() {
        interactor?.removeObservers()
    }
    
    func showHUD(_ title: String) {
        print("showHUD: \(title)")
        //view.showProgressHUD(title: title)
    }

    func hideHUD() {
        //view.hideProgressHUD()
        print("hideHUD")
    }
}

extension MainPresenter: InterfaceMainInteractorOutput {
    func gotoMainScene() {
        router?.gotoMainScene()
    }
}
