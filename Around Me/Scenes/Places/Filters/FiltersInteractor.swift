//
//  FiltersInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

//class : NSObject {

class FiltersInteractor: InterfaceFiltersInteractor {
    weak var presenter: InterfaceFiltersPresenter?
    
    unowned var delegate: InterfaceFiltersInteractorOutput
    
    // MARK: - Init
    init(delegate: InterfaceFiltersInteractorOutput) {
        self.delegate = delegate
    }
}
