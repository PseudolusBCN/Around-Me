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
    var interactor: InterfacePlacesListInteractorInput? { get set }
    var view: InterfacePlacesListViewController? { get set }
    
    func setupCollectionView(_ collectionView: UICollectionView, viewController: UIViewController)
    func collectionViewReuseIdentifier() -> String
}

protocol InterfacePlacesListInteractorInput: class {
    var presenter: InterfacePlacesListPresenter? { get set }
}

protocol InterfacePlacesListInteractorOutput: class {
}

protocol InterfacePlacesListRouter: class {
    var presenter: InterfacePlacesListPresenter? { get set }
}
