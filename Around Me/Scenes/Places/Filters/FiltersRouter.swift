//
//  FiltersRouter.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersRouter: InterfaceFiltersRouter {
    weak var presenter: InterfaceFiltersPresenter?
    weak var view: UIViewController?
    
    func returnToOriginScene() {
        view?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
