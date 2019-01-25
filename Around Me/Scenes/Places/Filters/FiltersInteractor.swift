//
//  FiltersInteractor.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

//class : NSObject {

class FiltersInteractor: InterfaceFiltersInteractor {
    weak var presenter: InterfaceFiltersPresenter?
    
    unowned var delegate: InterfaceFiltersInteractorOutput
    
    var filterType: FilterType
    var filterSelectionMode: FilterSelectionMode
    var reloadDataAfterFilterChange: ReloadDataAfterFilterChange
    
    // MARK: - Init
    init(delegate: InterfaceFiltersInteractorOutput, filterType: FilterType, filterSelectionMode: FilterSelectionMode, reloadDataAfterFilterChange: ReloadDataAfterFilterChange) {
        self.delegate = delegate
        self.filterType = filterType
        self.filterSelectionMode = filterSelectionMode
        self.reloadDataAfterFilterChange = reloadDataAfterFilterChange
    }
    
    // MARK: - Public methods
    func numberOfFilters() -> Int {
        return FiltersManager.sharedInstance().filters(filterType).count
    }
    
    func filterTitle(_ indexPath: IndexPath) -> String {
        return FiltersManager.sharedInstance().orderedFilters(filterType)[indexPath.row].localizedName
    }
    
    func filterSelected(_ indexPath: IndexPath) -> Bool {
        return FiltersManager.sharedInstance().orderedFilters(filterType)[indexPath.row].selected
    }
    
    func selectFilter(_ indexPath: IndexPath) {
        let filtersManager = FiltersManager.sharedInstance()

        if filterSelectionMode == .single {
            if filtersManager.selectedFilterIndex != nil {
                filtersManager.filters(filterType)[filtersManager.selectedFilterIndex!].selected = false
            }
        }

        let key = filtersManager.orderedFilters(filterType)[indexPath.row].key
        let filter = filtersManager.filters(filterType).filter { $0.key == key }

        switch filterSelectionMode {
        case .single:
            if filtersManager.selectedFilterIndex == Array(filtersManager.filters(filterType)).index(of: filter[0]) {
                filtersManager.selectedFilterIndex = nil
            } else {
                filtersManager.selectedFilterIndex = Array(filtersManager.filters(filterType)).index(of: filter[0])
                filtersManager.filters(filterType)[filtersManager.selectedFilterIndex!].selected = true
            }
        case .multiple:
            let selectedIndex = Array(filtersManager.filters(filterType)).index(of: filter[0])
            filtersManager.filters(filterType)[selectedIndex!].selected = !filtersManager.filters(filterType)[selectedIndex!].selected
        }

        if reloadDataAfterFilterChange == .yes {
            NotificationsManager().sendNotification(notificationFilterChanged)
        }

        delegate.filterSelected()
    }
}
