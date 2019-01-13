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
    var value: String
    var selected = false
    
    // MARK: - Init
    init(_ name: String, value: String) {
        self.name = name
        self.value = value
    }

    init(_ name: String, value: String, selected: Bool) {
        self.name = name
        self.value = value
        self.selected = selected
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
        
        setLocalizedSettings()
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

    func optionTitle(_ indexPath: IndexPath) -> String {
        return settings[indexPath.section].values[indexPath.row].name
    }

    func optionValue(_ indexPath: IndexPath) -> String {
        return settings[indexPath.section].values[indexPath.row].value
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
        let section = indexPath.section
        if section == sectionRadious {
            let selectedRadius = ConfigurationManager().retrieveDataFromPlist("searchRadius") as! String
            settings[section].values[settings[section].values.index(where: { $0.value == selectedRadius })!].selected = false
            settings[section].values[indexPath.row].selected = true
            ConfigurationManager().saveDataToPlist("searchRadius", value: optionValue(indexPath))
        } else if section == sectionLanguage {
            let selectedLanguage = ConfigurationManager().retrieveDataFromPlist("appLanguage") as! String
            settings[section].values[settings[section].values.index(where: { $0.value == selectedLanguage })!].selected = false
            settings[section].values[indexPath.row].selected = true
            ConfigurationManager().saveDataToPlist("appLanguage", value: optionValue(indexPath))
            LocalizeManager().updateLanguage(optionValue(indexPath))

            setLocalizedSettings()
            
            NotificationsManager().sendNotification(notificationLanguageChanged)
        }
        delegate.optionSelected()
    }
    
    // MARK: - Private methods
    private func localizedDistance(_ number: Int) -> String {
        if number < 1000 {
            return String.localizedStringWithFormat("%d", number)
        } else {
            return String.localizedStringWithFormat("%.1f", Float(number) / 1000.0)
        }
    }
    
    func setLocalizedSettings() {
        let radiousOptions = [Option(String(format: "generic.distance.meters".localized, localizedDistance(100)), value: "100"),
                              Option(String(format: "generic.distance.meters".localized, localizedDistance(250)), value: "250"),
                              Option(String(format: "generic.distance.meters".localized, localizedDistance(500)), value: "500"),
                              Option(String(format: "generic.distance.kilometers".localized, localizedDistance(1000)), value: "1000"),
                              Option(String(format: "generic.distance.kilometers".localized, localizedDistance(2500)), value: "2500"),
                              Option(String(format: "generic.distance.kilometers".localized, localizedDistance(5000)), value: "5000")]
        let selectedRadius = ConfigurationManager().retrieveDataFromPlist("searchRadius") as! String
        radiousOptions[radiousOptions.index(where: { $0.value == selectedRadius })!].selected = true
        
        let languageOptions = [Option("settings.language.option.english".localized, value: "en", selected: false),
                               Option("settings.language.option.catalan".localized, value: "ca", selected: false)]
        let selectedLanguage = ConfigurationManager().retrieveDataFromPlist("appLanguage") as! String
        languageOptions[languageOptions.index(where: { $0.value == selectedLanguage })!].selected = true
        
        let radiousSettings = Setting("settings.radiousSearch".localized, values: radiousOptions)
        let languageSettings = Setting("settings.language.title".localized, values: languageOptions)
        if settings.count > 0 {
            radiousSettings.expanded = settings[sectionRadious].expanded
            languageSettings.expanded = settings[sectionLanguage].expanded
            settings.removeAll()
        }
        settings.append(radiousSettings)
        settings.append(languageSettings)
    }
}
