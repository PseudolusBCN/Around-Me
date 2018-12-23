//
//  MainInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceMainViewController: class {
    var presenter: InterfaceMainPresenter? { get set }
}

protocol InterfaceMainPresenter: class {
    var router: InterfaceMainRouter? { get set }
    var interactor: InterfaceMainInteractor? { get set }
    var view: InterfaceMainViewController? { get set }
    
    func setupObservers()
    func removeObservers()
    
    func appVersion() -> String
}

protocol InterfaceMainInteractor: class {
    var presenter: InterfaceMainPresenter? { get set }
    
    func setupObservers()
    func removeObservers()
}

protocol InterfaceMainInteractorOutput: class {
    func gotoMainScene()
}

protocol InterfaceMainRouter: class {
    var presenter: InterfaceMainPresenter? { get set }
    
    func gotoMainScene()
}
