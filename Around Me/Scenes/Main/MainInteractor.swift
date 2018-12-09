//
//  MainInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainInteractor: InterfaceMainInteractorInput {
    weak var presenter: InterfaceMainPresenter?

    unowned var delegate: InterfaceMainInteractorOutput

    init(delegate: InterfaceMainInteractorOutput) {
        self.delegate = delegate
    }

    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(locationUnauthorized), name: NSNotification.Name(rawValue: notificationLocationUnauthorized), object: nil)
    }

    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func locationUnauthorized() {
    }
    
    @objc private func getData() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
        
        //*****presenter?.showHUD("generic.hud.downloadingData".localized)
        
        let placesManager = PlacesManager.sharedInstance()
        
        let radius = Int(ConfigurationManager().retrieveStringFromPlist("searchRadius"))
        DataManager().getPointsListWithToken(placesManager.nextPageToken, radius: radius!, types: "") { (response, error) in
            guard error == nil else {
                return
            }
            
            placesManager.addPlacesFromData(response!)
            
//            self.hideProgressHUD()
//
//            self.navigationController?.present(TabBarViewController(), animated: true)
            //self.presenter?.gotoMainScene()
            self.delegate.gotoMainScene()
        }
    }
}
