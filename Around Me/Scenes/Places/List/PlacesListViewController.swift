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
    @IBOutlet weak var filtersTitleLabel: UILabel!
    @IBOutlet weak var filtersLabel: UILabel!
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
        filtersTitleLabel.text = "generic.filterSelected".localized
        filtersLabel.text = FiltersManager.sharedInstance().selectedFiltersString(.list)

        presenter?.clearCollectionViewLayout(placesCollectionView)
        if presenter?.itemsForSection(placesCollectionView, section: 0) == 0 {
            emptyResultsView = EmptyResultsView(frame: placesCollectionView.frame)
            emptyResultsView!.imageIcon.image = UIImage(named: "IcoList_Empty")
            emptyResultsView!.titleLabel.text = "generic.emptyData.places".localized
            view.addSubview(emptyResultsView!)
        } else {
            placesCollectionView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if presenter?.itemsForSection(placesCollectionView, section: 0) == 0 {
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
        return (presenter?.itemsForSection(collectionView, section: section))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = presenter?.collectionViewCell(collectionView, indexPath: indexPath) {
            if cell is PlaceCollectionViewCell {
                (cell as! PlaceCollectionViewCell).delegate = self
            }
            return cell as! UICollectionViewCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if PlacesManager.sharedInstance().nextPageToken.count > 0 {
            if indexPath.row == (presenter?.itemsForSection(placesCollectionView, section: indexPath.section))! - 1 {
                presenter?.downloadData()
            }
        }
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
