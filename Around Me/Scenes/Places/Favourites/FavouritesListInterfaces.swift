//
//  FavouritesListInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceFavouritesListViewController: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
}

protocol InterfaceFavouritesListPresenter: class {
    var router: InterfaceFavouritesListRouter? { get set }
    var interactor: InterfaceFavouritesListInteractor? { get set }
    var view: InterfaceFavouritesListViewController? { get set }

    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController)
    func favouriteCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> FavouriteCollectionViewCell
    func itemsForSection(_ section: Int) -> Int
    
    func gotoFilters()
}

protocol InterfaceFavouritesListPresenterOutput: class {
    func updateData()
}

protocol InterfaceFavouritesListInteractor: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
    
    func numberOfFavourites() -> Int
    func place(_ index: NSInteger) -> Place
}

protocol InterfaceFavouritesListInteractorOutput: class {
}

protocol InterfaceFavouritesListRouter: class {
    var presenter: InterfaceFavouritesListPresenter? { get set }
    
    func gotoFiltersScene()
}
