//
//  APIPlace.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import ObjectMapper

class APIPlace: Mappable {
    var geometry: APIPlaceGeometry?
    var icon: String?
    var id: String?
    var name: String?
    var photos: [APIPlacePhoto]?
    var placeID: String?
    var reference: String?
    var scope: String?
    var types: [String]?
    var vicinity: String?
    var openingHours: APIPlaceOpeningHours?
    var plusCode: APIPlacePlusCode?
    var rating: Double?
    var priceLevel: Int?
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    func mapping(map: Map) {
        geometry <- map["geometry"]
        icon <- map["icon"]
        id <- map["id"]
        name <- map["name"]
        photos <- map["photos"]
        placeID <- map["place_id"]
        reference <- map["reference"]
        scope <- map["scope"]
        types <- map["types"]
        vicinity <- map["vicinity"]
        openingHours <- map["opening_hours"]
        plusCode <- map["plus_code"]
        rating <- map["rating"]
        priceLevel <- map["price_level"]
    }
}
