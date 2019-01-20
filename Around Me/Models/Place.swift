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
    var type = ""
    var location = PlaceLocation()
    
    // MARK: - Init
    override init() {
        super.init()
    }

    init(_ place: APIPlace) {
        self.id = place.id!
        self.name = place.name!
        self.icon = place.icon!
        self.type = place.types![0]
        self.location = PlaceLocation(latitude: (place.geometry?.location?.lat)!, longitude: (place.geometry?.location?.lng)!)
    }
    
    init(_ place: NSManagedObject)  {
        self.id = place.value(forKey: "id") as! String
        self.name = place.value(forKey: "name") as! String
        self.icon = place.value(forKey: "icon") as! String
        self.type = place.value(forKey: "type") as! String
        self.location = PlaceLocation(latitude: place.value(forKey: "latitude") as! Double, longitude: place.value(forKey: "longitude") as! Double)
    }
}
