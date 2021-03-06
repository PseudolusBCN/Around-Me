//
//  LocalizeManager.swift
//  Around Me
//
//  Created by Miquel Masip on 08/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class LocalizeManager: NSObject {
    // MARK: - Init
    override init() {
        super.init()
    }

    // MARK: - Public methods
    func setup() {
        Localize.update(provider: .json)
        Localize.update(fileName: "Translations")
        Localize.update(defaultLanguage: "en")
        
        let selectedLanguage = ConfigurationManager().retrieveDataFromPlist("appLanguage") as! String
        Localize.update(language: selectedLanguage)
    }
    
    func updateLanguage(_ language: String) {
        Localize.update(language: language)
    }
}
