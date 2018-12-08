//
//  InterfaceMainInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import Foundation

protocol InterfaceMainInteractor {
    var presenter: InterfaceMainPresenter? { get set }

    func setupObservers()
    func removeObservers()
}
