//
//  PlacesListInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListInteractor: InterfacePlacesListInteractorInput {
    weak var presenter: InterfacePlacesListPresenter?
    
    unowned var delegate: InterfacePlacesListInteractorOutput
    
    init(delegate: InterfacePlacesListInteractorOutput) {
        self.delegate = delegate
    }
}
