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

        guard placesManager.place(id: placeId) != nil else {
            return
        }

        let place = placesManager.place(id: placeId)!
        DatabaseManager().addPlaceToFavourites(place, completion: { (error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                let favouritesManager = FavouritesManager.sharedInstance()
                favouritesManager.addFavourite(place)
                self.delegate.favouriteAdded()
            }
        })
    }
    
    func removeFavourite(_ placeId: String) {
        let favouritesManager = FavouritesManager.sharedInstance()
        guard favouritesManager.placeIsFavourite(placeId) else {
            return
        }
        
        let place = favouritesManager.place(id: placeId)!
        DatabaseManager().removePlaceFromFavourites(place.id, completion: { (error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                favouritesManager.removeFavourite(place)
                self.delegate.favouriteRemoved()
            }
        })
    }

    func numberOfPlaces() -> Int {
        return placesManager.numerOfPlaces()
    }

    func place(_ index: NSInteger) -> Place {
        return placesManager.place(index: index)
    }

    func placeIsFavourite(_ place: Place) -> Bool {
        return favouritesManager.placeIsFavourite(place.id)
    }

    func getRemoteData() {
        HUDManager.sharedInstance().showProgressHUD(title: "generic.hud.downloadingData".localized)
        
        let placesManager = PlacesManager.sharedInstance()
        let radius = Int(ConfigurationManager().retrieveDataFromPlist("searchRadius") as! String)
        let type = FiltersManager.sharedInstance().selectedFilter(.list)
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
