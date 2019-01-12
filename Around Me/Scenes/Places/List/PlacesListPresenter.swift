//
//  PlacesListPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import AlamofireImage

class PlacesListPresenter: InterfacePlacesListPresenter {
    var router: InterfacePlacesListRouter?
    var interactor: InterfacePlacesListInteractor?
    weak var view: InterfacePlacesListViewController?
    
    unowned var delegate: InterfacePlacesListPresenterOutput

    // MARK: - Init
    init(delegate: InterfacePlacesListPresenterOutput) {
        self.delegate = delegate
    }

    // MARK: - Public methods
    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController) {
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionViewReuseIdentifier())
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = collectionViewLayout

        collectionView.dataSource = viewController as? UICollectionViewDataSource
        collectionView.delegate = viewController as? UICollectionViewDelegate

        addRefreshControl(collectionView)
    }
    
    func placeCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> PlaceCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReuseIdentifier(), for: indexPath) as! PlaceCollectionViewCell

        let place: Place = (interactor?.place(indexPath.row))!
        cell.placeId = place.id
        cell.placeIcon.af_setImage(withURL: URL(string: place.icon)!)
        cell.placeLabel.text = place.name
        if (interactor?.placeIsFavourite(place))! {
            cell.favouriteButton.isSelected = true
            cell.favouriteImage.image = UIImage(named: "BtnFavourite_On")
        } else {
            cell.favouriteButton.isSelected = false
            cell.favouriteImage.image = UIImage(named: "BtnFavourite_Off")
        }

        return cell
    }

    func itemsForSection(_ section: Int) -> Int {
        return (interactor?.numberOfPlaces())!
    }

    func addFavourite(_ placeId: String) {
        interactor?.addFavourite(placeId)
    }
    
    func removeFavourite(_ placeId: String) {
        interactor?.removeFavourite(placeId)
    }
    
    func downloadData() {
        interactor?.getRemoteData()
    }
    
    func downloadNewData() {
        PlacesManager.sharedInstance().clearToken()
        PlacesManager.sharedInstance().clearData()
        
        interactor?.getRemoteData()
    }
    
    func gotoFilters() {
        router?.gotoFiltersScene()
    }

    // MARK: - Private methods
    private func collectionViewReuseIdentifier() -> String {
        return "PlaceCollectionCell"
    }
    
    private func addRefreshControl(_ collectionView: UICollectionView) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.black
        
        collectionView.addSubview(refreshControl)
    }

    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()

        downloadNewData()
    }
}

extension PlacesListPresenter: InterfacePlacesListInteractorOutput {
    func favouriteAdded() {
        delegate.updateData()
    }

    func favouriteRemoved() {
        delegate.updateData()
    }
    
    func dataDownloaded() {
        delegate.updateData()
    }
}
