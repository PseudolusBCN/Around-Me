//
//  PlacesListViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class PlacesListViewController: UIViewController, InterfacePlacesListViewController {
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    var presenter: InterfacePlacesListPresenter?

    private var emptyResultsView: EmptyResultsView?

    // MARK: - Init
    init() {
        super.init(nibName: "PlacesListViewController", bundle: nil)

        tabBarItem.image = UIImage(named:"IcoList")
        setLocalizedTitles()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "IcoFilter"), style: .plain, target: self, action: #selector(goToFilters))

        NotificationCenter.default.addObserver(self, selector: #selector(setLocalizedTitles), name: NSNotification.Name(rawValue: notificationLanguageChanged), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downloadNewData), name: NSNotification.Name(rawValue: notificationFilterChanged), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupCollectionView(placesCollectionView, viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if presenter?.itemsForSection(0) == 0 {
            emptyResultsView = EmptyResultsView(frame: placesCollectionView.frame)
            emptyResultsView!.imageIcon.image = UIImage(named: "IcoList_Empty")
            emptyResultsView!.titleLabel.text = "generic.emptyData.places".localized
            view.addSubview(emptyResultsView!)
        } else {
            placesCollectionView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if presenter?.itemsForSection(0) == 0 {
            emptyResultsView!.removeFromSuperview()
        }
    }

    // MARK: - Private methods
    @objc private func setLocalizedTitles() {
        navigationItem.title = "main.appName".localized
        tabBarItem.title = "main.tabBar.list".localized
    }

    @objc private func downloadNewData() {
        presenter?.downloadNewData()
    }

    @objc private func goToFilters() {
        presenter?.gotoFilters()
    }
}

extension PlacesListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.itemsForSection(section))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = presenter?.placeCollectionViewCell(collectionView, indexPath: indexPath) {
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if PlacesManager.sharedInstance().nextPageToken.count > 0 {
            if indexPath.row == (presenter?.itemsForSection(indexPath.section))! - 1 {
                presenter?.downloadData()
            }
        }
    }
}

extension PlacesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: (collectionView.frame.size.width - 10) / 2, height: 120)
        } else {
            return CGSize(width: (collectionView.frame.size.width - 10), height: 120)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 2.5, left: 5, bottom: 2.5, right: 5)
    }
}

extension PlacesListViewController: PlaceCollectionViewCellDelegate {
    func favouriteButton_Pressed(_ button: UIButton, placeId: String) {
        if button.isSelected {
            presenter?.removeFavourite(placeId)
        } else {
            presenter?.addFavourite(placeId)
        }
    }
}

extension PlacesListViewController: InterfacePlacesListPresenterOutput {
    func updateData() {
        placesCollectionView.reloadData()
    }
}
