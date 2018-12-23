//
//  SettingsInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceSettingsViewController: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}

protocol InterfaceSettingsPresenter: class {
    var router: InterfaceSettingsRouter? { get set }
    var interactor: InterfaceSettingsInteractor? { get set }
    var view: InterfaceSettingsViewController? { get set }
    
    func numberOfSections() -> Int
    func numberOfRows(_ section: Int) -> Int
    func sectionTitle(_ section: Int) -> String
}

protocol InterfaceSettingsInteractor: class {
    var presenter: InterfaceSettingsPresenter? { get set }

    func numberOfSettings() -> Int
    func numberOfOptions(_ section: Int) -> Int
    func settingTitle(_ section: Int) -> String
}

protocol InterfaceSettingsInteractorOutput: class {
}

protocol InterfaceSettingsRouter: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}
