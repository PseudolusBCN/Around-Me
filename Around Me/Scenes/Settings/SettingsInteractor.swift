//
//  SettingsInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

private class Setting {
    var name: String = ""
    var values: [Any] = []
    
    // MARK: - Init
    init(_ name: String, values: [Any]) {
        self.name = name
        self.values = values
    }
}

class SettingsInteractor: InterfaceSettingsInteractor {
    weak var presenter: InterfaceSettingsPresenter?
    
    unowned var delegate: InterfaceSettingsInteractorOutput

    private var settings: [Setting] = []

    private let sectionRadious = 0
    private let sectionLanguage = 1
    
    // MARK: - Init
    init(delegate: InterfaceSettingsInteractorOutput) {
        self.delegate = delegate

        settings.append(Setting("settings.radiousSearch".localized, values: [100, 250, 500, 1000, 2500, 5000]))
        settings.append(Setting("settings.language.title".localized, values: ["settings.language.option.english".localized, "settings.language.option.catalan".localized]))
    }

    // MARK: - Public methods
    func numberOfSettings() -> Int {
        return settings.count
    }

    func numberOfOptions(_ section: Int) -> Int {
        return settings[section].values.count
    }
    
    func settingTitle(_ section: Int) -> String {
        return settings[section].name
    }
}
