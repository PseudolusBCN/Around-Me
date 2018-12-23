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
    
    func numberOfSections() -> Int {
        return interactor?.numberOfSettings() ?? 0
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return interactor?.numberOfOptions(section) ?? 0
    }
    
    func sectionTitle(_ section: Int) -> String {
        return interactor?.settingTitle(section) ?? ""
    }
}

extension SettingsPresenter: InterfaceSettingsInteractorOutput {
}
