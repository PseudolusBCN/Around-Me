//
//  FavouritesListViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class FavouritesListViewController: UIViewController, InterfaceFavouritesListViewController {
    @IBOutlet weak var favouritesCollectionView: UICollectionView!

    var presenter: InterfaceFavouritesListPresenter?
    
    private var emptyResultsView: EmptyResultsView?

    // MARK: - Init
    init() {
        super.init(nibName: "FavouritesListViewController", bundle: nil)

        tabBarItem.image = UIImage(named:"IcoFavourites")
        setLocalizedTitles()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "IcoFilter"), style: .plain, target: self, action: #selector(goToFilters))

        NotificationCenter.default.addObserver(self, selector: #selector(setLocalizedTitles), name: NSNotification.Name(rawValue: notificationLanguageChanged), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.setupCollectionView(favouritesCollectionView, viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if presenter?.itemsForSection(0) == 0 {
            emptyResultsView = EmptyResultsView(frame: favouritesCollectionView.frame)
            emptyResultsView!.titleLabel.text = "generic.emptyData.favourites".localized
            view.addSubview(emptyResultsView!)
        } else {
            favouritesCollectionView.reloadData()
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
        tabBarItem.title = "main.tabBar.favourites".localized
    }

    @objc private func goToFilters() {
        presenter?.gotoFilters()
    }
}

extension FavouritesListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.itemsForSection(section))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = presenter?.favouriteCollectionViewCell(collectionView, indexPath: indexPath) {
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FavouritesListViewController: UICollectionViewDelegateFlowLayout {
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

extension FavouritesListViewController: InterfaceFavouritesListPresenterOutput {
    func updateData() {
        favouritesCollectionView.reloadData()
    }
}
