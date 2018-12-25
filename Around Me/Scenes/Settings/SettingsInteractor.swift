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
    var values: [Option] = []
    var expanded = false
    
    // MARK: - Init
    init(_ name: String, values: [Option]) {
        self.name = name
        self.values = values
    }
}

private class Option {
    var name: String = ""
    var selected = false
    
    // MARK: - Init
    init(_ name: String) {
        self.name = name
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

        settings.append(Setting("settings.radiousSearch".localized, values: [Option("100"), Option("250"), Option("500"), Option("1000"), Option("2500"), Option("5000")]))
        settings.append(Setting("settings.language.title".localized, values: [Option("settings.language.option.english".localized), Option("settings.language.option.catalan".localized)]))
    }

    // MARK: - Public methods
    func numberOfSections() -> Int {
        return settings.count
    }

    func numberOfOptions(_ section: Int) -> Int {
        return settings[section].values.count
    }

    func sectionTitle(_ section: Int) -> String {
        return settings[section].name
    }

    func optionValue(_ indexPath: IndexPath) -> String {
        return settings[indexPath.section].values[indexPath.row].name
    }

    func sectionExpanded(_ section: Int) -> Bool {
        return settings[section].expanded
    }

    func optionSelected(_ indexPath: IndexPath) -> Bool {
        return settings[indexPath.section].values[indexPath.row].selected
    }

    func toggleSection(_ section: Int) {
        settings[section].expanded = !settings[section].expanded
        delegate.sectionToggled()
    }
    
    func selectOption(_ indexPath: IndexPath) {
        // *** MARCAR A FALSE TODAS LAS OPCIONES ANTES DE CAMBIAR
        //settings[indexPath.section].values[indexPath.row].selected = !settings[indexPath.section].values[indexPath.row].selected
        delegate.optionSelected()
    }
}
