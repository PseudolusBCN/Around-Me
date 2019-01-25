//
//  PlaceLocation.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlaceLocation: NSObject {
    var latitude: Double!
    var longitude: Double!

    // MARK: - Init
    override init() {
        super.init()
        
        self.latitude = 0.0
        self.longitude = 0.0
    }

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
