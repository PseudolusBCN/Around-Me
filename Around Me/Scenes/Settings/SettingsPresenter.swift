//
//  SettingsPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class SettingsPresenter: InterfaceSettingsPresenter {
    var router: InterfaceSettingsRouter?
    var interactor: InterfaceSettingsInteractor?
    weak var view: InterfaceSettingsViewController?
    
}

extension SettingsPresenter: InterfaceSettingsInteractorOutput {
}
