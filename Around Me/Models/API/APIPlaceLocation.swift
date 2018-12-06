//
//  APIPlaceLocation.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlaceLocation: Mappable {
    var lat: Double = 0.0
    var lng: Double = 0.0
    
    required init?(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
    }
    
    func mapping(map: Map) {
    }
}
