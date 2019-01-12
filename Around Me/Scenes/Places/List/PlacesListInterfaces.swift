//
//  PlacesListInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfacePlacesListViewController: class {
    var presenter: InterfacePlacesListPresenter? { get set }
}

protocol InterfacePlacesListPresenter: class {
    var router: InterfacePlacesListRouter? { get set }
    var interactor: InterfacePlacesListInteractor? { get set }
    var view: InterfacePlacesListViewController? { get set }
    
    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController)
    func placeCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> PlaceCollectionViewCell
    func itemsForSection(_ section: Int) -> Int

    func addFavourite(_ placeId: String)
    func removeFavourite(_ placeId: String)
    
    func downloadData()
    func downloadNewData()
    
    func gotoFilters()
}

protocol InterfacePlacesListPresenterOutput: class {
    func updateData()
}

protocol InterfacePlacesListInteractor: class {
    var presenter: InterfacePlacesListPresenter? { get set }
    
    func addFavourite(_ placeId: String)
    func removeFavourite(_ placeId: String)

    func numberOfPlaces() -> Int
    func place(_ index: NSInteger) -> Place
    func placeIsFavourite(_ place: Place) -> Bool

    func getRemoteData()
}

protocol InterfacePlacesListInteractorOutput: class {
    func favouriteAdded()
    func favouriteRemoved()
    func dataDownloaded()
}

protocol InterfacePlacesListRouter: class {
    var presenter: InterfacePlacesListPresenter? { get set }
    
    func gotoFiltersScene()
}
