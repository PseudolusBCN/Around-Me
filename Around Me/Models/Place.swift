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
    var id = ""
    var name = ""
    var icon = ""
    var types: [String] = []
    var location = PlaceLocation()
    
    // MARK: - Init
    override init() {
        super.init()
    }

    init(_ place: APIPlace) {
        self.id = place.id!
        self.name = place.name!
        self.icon = place.icon!
        self.types = place.types!
        self.location = PlaceLocation(latitude: (place.geometry?.location?.lat)!, longitude: (place.geometry?.location?.lng)!)
    }
    
    init(_ place: NSManagedObject)  {
        self.id = place.value(forKey: "id") as! String
        self.name = place.value(forKey: "name") as! String
        self.icon = place.value(forKey: "icon") as! String
        self.types = place.value(forKey: "types") as! [String]
        self.location = PlaceLocation(latitude: place.value(forKey: "latitude") as! Double, longitude: place.value(forKey: "longitude") as! Double)
    }
}
