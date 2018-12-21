//
//  APIPlacePhoto.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlacePhoto: Mappable {
    var height: Int = 0
    var width: Int = 0
    var htmlAttributions: [String]?
    var photoReference: String?
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    func mapping(map: Map) {
        height <- map["height"]
        width <- map["width"]
        htmlAttributions <- map["html_attributions"]
        photoReference <- map["photo_reference"]
    }
}
