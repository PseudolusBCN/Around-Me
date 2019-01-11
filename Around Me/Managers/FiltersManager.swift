//
//  FiltersManager.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersManager: NSObject {
    private static var instance: FiltersManager?
    
    var filters: [Filter]! = []

    // MARK: - Singleton
    class func sharedInstance() -> FiltersManager {
        guard let currentInstance = instance else {
            instance = FiltersManager()
            return instance!
        }
        return currentInstance
    }
    
    class func clearInstance() {
        instance = nil
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Init
    override init() {
        super.init()

        NotificationCenter.default.addObserver(self, selector: #selector(setLocalizedTitles), name: NSNotification.Name(rawValue: notificationLanguageChanged), object: nil)
    }

    // MARK - Public methods
    func retrieveFilters() {
        let filtersData = ConfigurationManager().retrieveDataFromPlist("filters") as! [Any]
        for item in filtersData {
            let filterKey = (item as! NSDictionary).object(forKey: "key") as! String
            let filterSelected = (item as! NSDictionary).object(forKey: "selected") as! Bool
            filters.append(Filter(key: filterKey, selected: filterSelected))
        }
    }
    
    func orderedFilters() -> [Filter] {
        return filters.sorted(by: { $0.localizedName < $1.localizedName })
    }

    // MARK: - Private methods
    @objc private func setLocalizedTitles() {
        for index in 0...(filters.count - 1) {
            filters[index].localizedName = "config.place.type.\(filters[index].key)".localized
        }
    }
}
