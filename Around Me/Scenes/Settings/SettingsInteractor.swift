//
//  SettingsInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class SettingsInteractor: InterfaceSettingsInteractorInput {
    weak var presenter: InterfaceSettingsPresenter?
    
    unowned var delegate: InterfaceSettingsInteractorOutput
    
    init(delegate: InterfaceSettingsInteractorOutput) {
        self.delegate = delegate
    }
}
