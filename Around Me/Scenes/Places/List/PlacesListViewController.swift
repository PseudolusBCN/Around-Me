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

class PlacesListViewController: BaseCollectionViewController, InterfacePlacesListViewController {
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    private let placesManager = PlacesManager.sharedInstance()
    
    private let placeCollectionCell = "PlaceCollectionCell"
    
    var presenter: InterfacePlacesListPresenter?

    init() {
        super.init(nibName: "PlacesListViewController", bundle: nil)

        setNavBarTitle("main.appName".localized)
        tabBarItem.title = "main.tabBar.list".localized
        tabBarItem.image = UIImage(named:"IcoList")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBarTitle("main.appName".localized)

        placesCollectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: placeCollectionCell)

        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        placesCollectionView.collectionViewLayout = collectionViewLayout

        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        placesCollectionView.reloadData()
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
        let place = placesManager.places[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeCollectionCell, for: indexPath) as! PlaceCollectionViewCell

        cell.placeIcon.af_setImage(withURL: URL(string: place.icon)!)
        cell.placeLabel.text = place.name

        return cell
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
