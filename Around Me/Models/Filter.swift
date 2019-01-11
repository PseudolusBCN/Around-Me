//
//  Filter.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class Filter: NSObject {
    var key = ""
    var localizedName = ""
    var selected = false

    // MARK: - Init
    override init() {
        super.init()
    }
    
    init(key: String) {
        self.key = key
        self.localizedName = "config.place.type.\(key)".localized
    }

    init(key: String, selected: Bool) {
        self.key = key
        self.localizedName = "config.place.type.\(key)".localized
        self.selected = selected
    }
}
