//
//  APIPlacePlusCode.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlacePlusCode: Mappable {
    var compoundCode: String?
    var globalCode: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        compoundCode <- map["compound_code"]
        globalCode <- map["global_code"]
    }
}
