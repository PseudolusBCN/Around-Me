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
    
    // MARK: - Init
    init(delegate: InterfaceFiltersInteractorOutput) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    func numberOfFilters() -> Int {
        return FiltersManager.sharedInstance().filters.count
    }
    
    func filterTitle(_ indexPath: IndexPath) -> String {
        return FiltersManager.sharedInstance().orderedFilters()[indexPath.row].localizedName
    }
    
    func filterSelected(_ indexPath: IndexPath) -> Bool {
        return FiltersManager.sharedInstance().orderedFilters()[indexPath.row].selected
    }
    
    func selectFilter(_ indexPath: IndexPath) {
    }
}
