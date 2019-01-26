//
//  PlacesManager.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

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

    func placeTypes(_ place: Place, filterType: FilterType) -> String {
        var typesList: String = ""
        for item in 0 ..< place.types.count {
            let placeType = FiltersManager.sharedInstance().filters(filterType).filter({ $0.key == place.types[item] })
            if !placeType.isEmpty {
                let localizedType = placeType[0].localizedName
                typesList = typesList + localizedType + ", "
            }
        }
        return (typesList.count > 0) ? String(typesList.dropLast(2)) : typesList
    }
}
