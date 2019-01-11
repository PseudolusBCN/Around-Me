//
//  FiltersPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersPresenter: InterfaceFiltersPresenter {
    var router: InterfaceFiltersRouter?
    var interactor: InterfaceFiltersInteractor?
    weak var view: InterfaceFiltersViewController?
    
    unowned var delegate: InterfaceFiltersPresenterOutput
    
    // MARK: - Init
    init(delegate: InterfaceFiltersPresenterOutput) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    func setupTableView(_ tableView: UITableView, viewController: UIViewController) {
        tableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: tableViewReuseIdentifier())
        
        tableView.separatorStyle = .singleLine
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.dataSource = viewController as? UITableViewDataSource
        tableView.delegate = viewController as? UITableViewDelegate
    }
    
    func filterTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> FilterTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewReuseIdentifier(), for: indexPath) as! FilterTableViewCell
        cell.titleLabel.text = interactor?.filterTitle(indexPath)
        
        let icon = UIImage(named: "IcoOption_Selected")?.withRenderingMode(.alwaysTemplate)
        cell.statusIcon.tintColor = UIColor.blue
        cell.statusIcon.image = icon
        cell.statusIcon.isHidden = !((interactor?.filterSelected(indexPath))!)
        
        return cell
    }

    func selectFilter(_ indexPath: IndexPath) {
        interactor?.selectFilter(indexPath)
    }

    func closeView() {
        router?.returnToOriginScene()
    }
    
    // MARK: - Private methods
    func tableViewReuseIdentifier() -> String {
        return "FilterTableCell"
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return interactor?.numberOfFilters() ?? 0
    }
}

extension FiltersPresenter: InterfaceFiltersInteractorOutput {
    func filterSelected() {
        delegate.updateData()
    }
}
