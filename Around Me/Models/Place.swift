//
//  Place.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class Place: NSObject {
    var id: String = ""
    var name: String = ""
    var icon: String = ""
    var location: PlaceLocation = PlaceLocation()
    var favourite: Bool = false
    
    override init() {
        super.init()
    }

    init(place: APIPlace) {
        id = place.id!
        name = place.name!
        icon = place.icon!
        location = PlaceLocation(lat: (place.geometry?.location?.lat)!, lng: (place.geometry?.location?.lng)!)
    }
}
