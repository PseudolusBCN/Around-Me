//
//  PlacesListViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import AlamofireImage
import Localize

class PlacesListViewController: UIViewController, InterfacePlacesListViewController {
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    private let placesManager = PlacesManager.sharedInstance()

    var presenter: InterfacePlacesListPresenter?

    // MARK: - Configuration
    init() {
        super.init(nibName: "PlacesListViewController", bundle: nil)

        navigationItem.title = "main.appName".localized
        tabBarItem.title = "main.tabBar.list".localized
        tabBarItem.image = UIImage(named:"IcoList")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupCollectionView(placesCollectionView, viewController: self)
    }
}

extension PlacesListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesManager.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = presenter?.placeCollectionViewCell(collectionView, indexPath: indexPath) {
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
}

extension PlacesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
}

extension PlacesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if UIDevice.current.userInterfaceIdiom == .pad {
            width = (collectionView.frame.size.width - 10) / 2
        } else {
            width = collectionView.frame.size.width - 10
        }

        return CGSize(width: width, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension PlacesListViewController: PlaceCollectionViewCellDelegate {
    func favouriteButton_Pressed(_ button: UIButton, placeId: String) {
        if button.isSelected {
            presenter?.removeFavourite(placeId)
//            let favouritesManager = FavouritesManager.sharedInstance()
//            let place = favouritesManager.places.filter { $0.id == placeId }
//
//            guard place.count > 0 else {
//                return
//            }
//
//            DatabaseManager().removePlaceFromFavourites(place[0].id, completion: { (error) in
//                if let error = error as NSError? {
//                    fatalError("Unresolved error \(error), \(error.userInfo)")
//                } else {
//                    let favouritesManager = FavouritesManager.sharedInstance()
//                    favouritesManager.removeFavourite(place[0])
//                    self.placesCollectionView.reloadData()
//                }
//            })
        } else {
            presenter?.addFavourite(placeId)
//            let placesManager = PlacesManager.sharedInstance()
//            let place = placesManager.places.filter { $0.id == placeId }
//
//            guard place.count > 0 else {
//                return
//            }
//            DatabaseManager().addPlaceToFavourites(place[0], completion: { (error) in
//                if let error = error as NSError? {
//                    fatalError("Unresolved error \(error), \(error.userInfo)")
//                } else {
//                    let favouritesManager = FavouritesManager.sharedInstance()
//                    favouritesManager.addFavourite(place[0])
//                    self.placesCollectionView.reloadData()
//                }
//            })
        }
    }
}

extension PlacesListViewController: InterfacePlacesListPresenterOutput {
    func updateData() {
        self.placesCollectionView.reloadData()
    }
}
