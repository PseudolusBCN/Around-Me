//
//  MainInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class MainInteractor: InterfaceMainInteractor {
    weak var presenter: InterfaceMainPresenter?

    unowned var delegate: InterfaceMainInteractorOutput

    // MARK: - Init
    init(delegate: InterfaceMainInteractorOutput) {
        self.delegate = delegate
    }

    // MARK: - Public methods
    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(getRemoteData), name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(locationUnauthorized), name: NSNotification.Name(rawValue: notificationLocationUnauthorized), object: nil)
    }

    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Private methods
    @objc private func locationUnauthorized() {
    }
    
    @objc private func getRemoteData() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)

        HUDManager.sharedInstance().showProgressHUD(title: "generic.hud.downloadingData".localized)

        let placesManager = PlacesManager.sharedInstance()
        let radius = Int(ConfigurationManager().retrieveDataFromPlist("searchRadius") as! String)
        RemoteDataManager().getPointsListWithToken(placesManager.nextPageToken, radius: radius!, type: "") { (response, error) in
            guard error == nil else {
                return
            }
            placesManager.addPlacesFromData(response!)
            self.getLocalData()
        }
    }
    
    private func getLocalData() {
        HUDManager.sharedInstance().showProgressHUD(title: "generic.hud.retrievingFavourites".localized)

        let favouritesManager = FavouritesManager.sharedInstance()

        DatabaseManager().retrieveFavourites() { (response, error) in
            guard error == nil else {
                return
            }
            for favourite in response! {
                favouritesManager.addFavourite(favourite)
            }
            HUDManager.sharedInstance().hideProgressHUD()
            self.delegate.gotoMainScene()
        }
    }
}
