//
//  APIPlaceGeometry.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlaceGeometry: Mappable {
    var location: APIPlaceLocation?
    var viewport: APIPlaceViewport?
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    func mapping(map: Map) {
        location <- map["location"]
        viewport <- map["viewport"]
    }
}
