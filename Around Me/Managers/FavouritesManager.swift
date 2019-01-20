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
   
    private var favourites: [Place] = []

    // MARK: - Singleton
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
    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    // MARK: - Public methods
    func addFavourite(_ item: Any) {
        if let place = item as? Place {
            favourites.append(place)
        } else if let place = item as? APIPlace {
            favourites.append(Place.init(place))
        } else if let place = item as? NSManagedObject {
            favourites.append(Place.init(place))
        }
    }
    
    func removeFavourite(_ item: Any) {
        if let place = item as? Place {
            if let itemIndex = favourites.firstIndex(of: place) {
                favourites.remove(at: itemIndex)
            }
        } else if let place = item as? APIPlace {
            if let itemIndex = favourites.firstIndex(of: Place.init(place)) {
                favourites.remove(at: itemIndex)
            }
        } else  if let place = item as? NSManagedObject {
            if let itemIndex = favourites.firstIndex(of: Place.init(place)) {
                favourites.remove(at: itemIndex)
            }
        }
    }
    
    func place(id: String) -> Place? {
        return filteredFavourites().filter { $0.id == id }.isEmpty ? nil : filteredFavourites().filter { $0.id == id }[0]
    }
    
    func place(index: NSInteger) -> Place {
        return filteredFavourites()[index]
    }

    func numberOfFavourites() -> Int {
        return filteredFavourites().count
    }
    
    func placeIsFavourite(_ id: String) -> Bool {
        return !(filteredFavourites().filter { $0.id == id }).isEmpty
    }
    
    // MARK: - Private methods
    func filteredFavourites() -> [Place] {
        let filtersManager = FiltersManager.sharedInstance()
        let selectedFilters = filtersManager.selectedFilters(.favourites).map( { $0.key })
        if selectedFilters.isEmpty {
            return favourites
        } else {
            //return selectedFilters.isEmpty ? favourites : favourites.filter { selectedFilters.contains($0.types) }
            var favouritesList: [Place] = []
            for filter in selectedFilters {
                favouritesList.append(contentsOf: favourites.filter { $0.types.contains(filter)})
            }
            return favouritesList.reduce([], { $0.contains($1) ? $0 : $0 + [$1] })
        }
    }
}
