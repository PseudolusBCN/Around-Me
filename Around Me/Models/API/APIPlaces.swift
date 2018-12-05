//
//  APIPlaces.swift
//  Around Me
//
//  Created by Miquel Masip on 01/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Alamofire
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
    
    required init?(map: Map) {
    }
    
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

class APIPlaceOpeningHours: Mappable {
    var openNow: Bool = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        openNow <- map["open_now"]
    }
}

class APIPlacePhoto: Mappable {
    var height: Int = 0
    var width: Int = 0
    var htmlAttributions: [String]?
    var photoReference: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        height <- map["height"]
        width <- map["width"]
        htmlAttributions <- map["html_attributions"]
        photoReference <- map["photo_reference"]
    }
}

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
