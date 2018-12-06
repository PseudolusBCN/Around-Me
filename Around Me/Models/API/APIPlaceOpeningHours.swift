//
//  APIPlaceOpeningHours.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlaceOpeningHours: Mappable {
    var openNow: Bool = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        openNow <- map["open_now"]
    }
}
