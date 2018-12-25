//
//  SettingsPresenter.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class SettingsPresenter: InterfaceSettingsPresenter {
    var router: InterfaceSettingsRouter?
    var interactor: InterfaceSettingsInteractor?
    weak var view: InterfaceSettingsViewController?

    unowned var delegate: InterfaceSettingsPresenterOutput

    // MARK: - Init
    init(delegate: InterfaceSettingsPresenterOutput) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    func sectionViewReuseIdentifier() -> String {
        return "SettingSectionView"
    }

    func tableViewReuseIdentifier() -> String {
        return "SettingTableCell"
    }

    func setupTableView(_ tableView: UITableView, viewController: UIViewController) {
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: tableViewReuseIdentifier())

        tableView.separatorStyle = .none
        tableView.estimatedSectionHeaderHeight = 40.0
        tableView.estimatedRowHeight = 40.0
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.dataSource = viewController as? UITableViewDataSource
        tableView.delegate = viewController as? UITableViewDelegate
    }

    func numberOfSections() -> Int {
        return (interactor?.numberOfSections())!
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return (interactor?.numberOfOptions(section))!
    }
    
    func sectionTitle(_ section: Int) -> String {
        return interactor?.sectionTitle(section) ?? ""
    }

    func optionValue(_ indexPath: IndexPath) -> String {
        return interactor?.optionValue(indexPath) ?? ""
    }
    
    func sectionExpanded(_ section: Int) -> Bool {
        return interactor?.sectionExpanded(section) ?? false
    }
    
    func optionSelected(_ indexPath: IndexPath) -> Bool {
        return interactor?.optionSelected(indexPath) ?? false
    }

    func toggleSection(_ section: Int) {
        interactor?.toggleSection(section)
    }
    
    func selectOption(_ indexPath: IndexPath) {
        interactor?.selectOption(indexPath)
    }

    // MARK: - Private methods
}

extension SettingsPresenter: InterfaceSettingsInteractorOutput {
    func sectionToggled() {
        delegate.updateData()
    }
    
    func optionSelected() {
        delegate.updateData()
    }
}
