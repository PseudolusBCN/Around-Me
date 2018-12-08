//
//  InterfaceMainPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import Foundation

protocol InterfaceMainPresenter: class {
    var router: InterfaceMainRouter? { get set }
    var interactor: InterfaceMainInteractor? { get set }
    var view: InterfaceMainViewController? { get set }

    func setupObservers()
    func removeObservers()

    func showHUD(_ title: String)
    func hideHUD()
    
    func gotoMainScene()
}
