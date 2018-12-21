//
//  PlacesManager.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesManager: NSObject {
    private static var instance: PlacesManager?

    var places: [Place]!
    var nextPageToken: String!
    
    class func sharedInstance() -> PlacesManager {
        guard let currentInstance = instance else {
            instance = PlacesManager()
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
        nextPageToken = ""
    }
    
    func addPlacesFromData(_ data: APIPlaces) {
        nextPageToken = data.nextPageToken
        for place in data.results ?? [] {
            places?.append(Place.init(place))
        }
    }
}
