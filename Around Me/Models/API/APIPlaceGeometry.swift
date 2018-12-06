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
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        viewport <- map["viewport"]
    }
}
