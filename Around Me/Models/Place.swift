//
//  Place.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import CoreData

class Place: NSObject {
    var id: String = ""
    var name: String = ""
    var icon: String = ""
    var location: PlaceLocation = PlaceLocation()
    
    override init() {
        super.init()
    }

    init(_ place: APIPlace) {
        id = place.id!
        name = place.name!
        icon = place.icon!
        location = PlaceLocation(lat: (place.geometry?.location?.lat)!, lng: (place.geometry?.location?.lng)!)
    }
    
    init(_ place: NSManagedObject)  {
        id = place.value(forKey: "id") as! String
        name = place.value(forKey: "name") as! String
        icon = place.value(forKey: "icon") as! String
        location = PlaceLocation(lat: place.value(forKey: "latitude") as! Double, lng: place.value(forKey: "longitude") as! Double)
    }
}
