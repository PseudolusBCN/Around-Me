//
//  Filter.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

enum FilterType {
    case list
    case favourites
}

class Filter: NSObject {
    var key = ""
    var localizedName = ""
    var type: FilterType?
    var selected = false

    // MARK: - Init
    override init() {
        super.init()
    }
    
    init(key: String, type: FilterType) {
        self.key = key
        self.localizedName = "config.place.type.\(key)".localized
        self.type = type
    }

//    init(key: String, type: FilterType, selected: Bool) {
//        self.key = key
//        self.localizedName = "config.place.type.\(key)".localized
//        self.selected = selected
//    }
}
