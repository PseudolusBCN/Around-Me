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

    private var places: [Place] = []
    var nextPageToken = ""

    // MARK: - Singleton
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
    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    // MARK: - Public methods
    func addPlacesFromData(_ data: APIPlaces) {
        nextPageToken = data.nextPageToken ?? ""
        for place in data.results ?? [] {
            places.append(Place.init(place))
        }
    }
    
    func clearData() {
        places.removeAll()
    }

    func clearToken() {
        nextPageToken = ""
    }
    
    func place(id: String) -> Place? {
        return places.filter { $0.id == id }.isEmpty ? nil : places.filter { $0.id == id }[0]
    }

    func place(index: NSInteger) -> Place {
        return places[index]
    }
    
    func numerOfPlaces() -> Int {
        return places.count
    }
}
