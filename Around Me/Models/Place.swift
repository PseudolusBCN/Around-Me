//
//  Place.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class Place: NSObject {
    var id: String!
    var name: String!
    var location: PlaceLocation!
    
    override init() {
        super.init()

        id = ""
        name = ""
        location = PlaceLocation()
    }

    init(place: APIPlace) {
        id = place.id!
        name = place.name!
        location = PlaceLocation(lat: (place.geometry?.location?.lat)!, lng: (place.geometry?.location?.lng)!)
    }
}
