//
//  MainViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)
    }

    @objc private func getData() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationLocationUpdated), object: nil)

        let radius = Int(ConfigurationManager().retrieveStringFromPlist("searchRadius"))
        var nextPageToken = ""
        DataManager().getPointsListWithToken(nextPageToken, radius: radius!, types: "") { (response, error) in
            guard error == nil else {
                return
            }

            
        }
    }
}
