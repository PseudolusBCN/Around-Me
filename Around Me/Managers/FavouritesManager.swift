//
//  FavouritesManager.swift
//  Around Me
//
//  Created by Miquel Masip on 19/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import CoreData

class FavouritesManager: NSObject {
    private static var instance: FavouritesManager?
   
    var places: [Place]!

    class func sharedInstance() -> FavouritesManager {
        guard let currentInstance = instance else {
            instance = FavouritesManager()
            return instance!
        }
        return currentInstance
    }
    
    class func clearInstance() {
        instance = nil
    }
    
    override init() {
        super.init()

        places = []
    }
    
    func addFavourite(_ item: Any) {
        if let place = item as? Place {
            places?.append(place)
        } else if let place = item as? APIPlace {
            places?.append(Place.init(place))
        } else if let place = item as? NSManagedObject {
            places?.append(Place.init(place))
        }
    }
    
    func removeFavourite(_ item: Any) {
        if let place = item as? Place {
            if let itemIndex = places?.firstIndex(of: place) {
                places?.remove(at: itemIndex)
            }
        } else if let place = item as? APIPlace {
            if let itemIndex = places?.firstIndex(of: Place.init(place)) {
                places?.remove(at: itemIndex)
            }
        } else  if let place = item as? NSManagedObject {
            if let itemIndex = places?.firstIndex(of: Place.init(place)) {
                places?.remove(at: itemIndex)
            }
        }
    }
}
