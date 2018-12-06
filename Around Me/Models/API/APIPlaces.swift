//
//  APIPlaces.swift
//  Around Me
//
//  Created by Miquel Masip on 01/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlaces: Mappable {
    var htmlAttributions: [Any?]?
    var nextPageToken: String?
    var results: [APIPlace]?
    var status: requestStatus?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        htmlAttributions <- map["html_attributions"]
        nextPageToken <- map["next_page_token"]
        results <- map["results"]
        status <- map["status"]
    }
}
