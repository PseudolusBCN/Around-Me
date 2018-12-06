//
//  APIPlaceViewport.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlaceViewport: Mappable {
    var northeast: APIPlaceLocation?
    var southwest: APIPlaceLocation?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        northeast <- map["northeast"]
        southwest <- map["southwest"]
    }
}
