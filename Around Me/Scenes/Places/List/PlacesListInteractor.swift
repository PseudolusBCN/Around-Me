//
//  PlacesListInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListInteractor: InterfacePlacesListInteractor {
    weak var presenter: InterfacePlacesListPresenter?
    
    unowned var delegate: InterfacePlacesListInteractorOutput
    
    private let placesManager = PlacesManager.sharedInstance()
    private let favouritesManager = FavouritesManager.sharedInstance()

    // MARK: - Init
    init(delegate: InterfacePlacesListInteractorOutput) {
        self.delegate = delegate
    }

    // MARK: - Public methods
    func addFavourite(_ placeId: String) {
        let placesManager = PlacesManager.sharedInstance()
        let place = placesManager.places.filter { $0.id == placeId }
        
        guard place.count > 0 else {
            return
        }
        DatabaseManager().addPlaceToFavourites(place[0], completion: { (error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                let favouritesManager = FavouritesManager.sharedInstance()
                favouritesManager.addFavourite(place[0])
                self.delegate.favouriteAdded()
            }
        })
    }
    
    func removeFavourite(_ placeId: String) {
        let place = favouritesManager.places.filter { $0.id == placeId }
        guard place.count > 0 else {
            return
        }
        
        DatabaseManager().removePlaceFromFavourites(place[0].id, completion: { (error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                let favouritesManager = FavouritesManager.sharedInstance()
                favouritesManager.removeFavourite(place[0])
                self.delegate.favouriteRemoved()
            }
        })
    }

    func numberOfPlaces() -> Int {
        return placesManager.places.count
    }

    func place(_ index: NSInteger) -> Place {
        return placesManager.places[index]
    }

    func placeIsFavourite(_ place: Place) -> Bool {
        return (favouritesManager.places.filter { $0.id == place.id }).count > 0
    }

    func getRemoteData() {
        HUDManager.sharedInstance().showProgressHUD(title: "generic.hud.downloadingData".localized)
        
        let placesManager = PlacesManager.sharedInstance()
        let radius = Int(ConfigurationManager().retrieveDataFromPlist("searchRadius") as! String)
        let type = FiltersManager.sharedInstance().selectedFilter()
        RemoteDataManager().getPointsListWithToken(placesManager.nextPageToken, radius: radius!, type: type) { (response, error) in
            guard error == nil else {
                return
            }
            placesManager.addPlacesFromData(response!)
            
            HUDManager.sharedInstance().hideProgressHUD()
            self.delegate.dataDownloaded()
        }
    }
}
