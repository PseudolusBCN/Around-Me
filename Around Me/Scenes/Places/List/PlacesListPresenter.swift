//
//  PlacesListPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class PlacesListPresenter: InterfacePlacesListPresenter {
    var router: InterfacePlacesListRouter?
    var interactor: InterfacePlacesListInteractorInput?
    weak var view: InterfacePlacesListViewController?
    
    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController) {
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionViewReuseIdentifier())
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.dataSource = viewController as? UICollectionViewDataSource
        collectionView.delegate = viewController as? UICollectionViewDelegate
        collectionView.reloadData()
    }
    
    func collectionViewReuseIdentifier() -> String {
        return "PlaceCollectionCell"
    }
}

extension PlacesListPresenter: InterfacePlacesListInteractorOutput {
}
