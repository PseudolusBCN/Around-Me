//
//  FavouritesListPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import AlamofireImage

class FavouritesListPresenter: InterfaceFavouritesListPresenter {
    var router: InterfaceFavouritesListRouter?
    var interactor: InterfaceFavouritesListInteractor?
    weak var view: InterfaceFavouritesListViewController?
 
    unowned var delegate: InterfaceFavouritesListPresenterOutput

    // MARK: - Init
    init(delegate: InterfaceFavouritesListPresenterOutput) {
        self.delegate = delegate
    }

    // MARK: - Public methods
    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController) {
        collectionView.register(UINib(nibName: "FavouriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionViewReuseIdentifier())
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.dataSource = viewController as? UICollectionViewDataSource
        collectionView.delegate = viewController as? UICollectionViewDelegate
    }
    
    func favouriteCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> FavouriteCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReuseIdentifier(), for: indexPath) as! FavouriteCollectionViewCell
        
        let place: Place = (interactor?.place(indexPath.row))!
        cell.placeId = place.id
        cell.placeIcon.af_setImage(withURL: URL(string: place.icon)!)
        cell.placeLabel.text = place.name
        
        return cell
    }
    
    func itemsForSection(_ section: Int) -> Int {
        return (interactor?.numberOfFavourites())!
    }

    func gotoFilters() {
        router?.gotoFiltersScene()
    }

    // MARK: - Private methods
    private func collectionViewReuseIdentifier() -> String {
        return "FavouriteCollectionCell"
    }
}

extension FavouritesListPresenter: InterfaceFavouritesListInteractorOutput {
}
