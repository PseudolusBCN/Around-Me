//
//  MainRouter.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainRouter: InterfaceMainRouter {
    weak var presenter: InterfaceMainPresenter?
    weak var view: UIViewController?
    
    func gotoMainScene() {
        let viewController = TabBarBuilder().main()
        view?.navigationController?.present(viewController, animated: true)
    }
}
