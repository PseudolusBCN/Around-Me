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
    var interactor: InterfaceMainInteractorInput? { get set }
    var view: InterfaceMainViewController? { get set }
    
    func setupObservers()
    func removeObservers()
}

protocol InterfaceMainInteractorInput: class {
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
