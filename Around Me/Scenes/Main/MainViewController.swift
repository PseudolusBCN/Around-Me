//
//  MainViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavBar()
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showProgressHUD(title: "Updating location")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
    }

    @objc private func getData() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)

        showProgressHUD(title: "Downloadind data")

        let placesManager = PlacesManager.sharedInstance()
        
        let radius = Int(ConfigurationManager().retrieveStringFromPlist("searchRadius"))
        DataManager().getPointsListWithToken(placesManager.nextPageToken, radius: radius!, types: "") { (response, error) in
            guard error == nil else {
                return
            }
            
            placesManager.addPlacesFromData(response!)
            self.hideProgressHUD()
        }
    }
}
