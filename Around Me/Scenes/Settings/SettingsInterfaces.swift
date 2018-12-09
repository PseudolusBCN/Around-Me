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
    var interactor: InterfaceSettingsInteractorInput? { get set }
    var view: InterfaceSettingsViewController? { get set }
}

protocol InterfaceSettingsInteractorInput: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}

protocol InterfaceSettingsInteractorOutput: class {
}

protocol InterfaceSettingsRouter: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}
