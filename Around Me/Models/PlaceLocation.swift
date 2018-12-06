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

    override init() {
        super.init()
        
        latitude = 0.0
        longitude = 0.0
    }

    init(lat: Double, lng: Double) {
        latitude = lat
        longitude = lng
    }
}
