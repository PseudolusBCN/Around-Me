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

    func settingSectionView(_ tableView: UITableView, section: Int) -> SettingSectionView {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionViewReuseIdentifier()) as? SettingSectionView ?? SettingSectionView(reuseIdentifier: sectionViewReuseIdentifier())
        header.titleLabel.text = interactor?.sectionTitle(section)
        header.section = section
        header.status = (interactor?.sectionExpanded(section))! ? .expanded : .collapsed
        return header
    }

    func optionTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> SettingTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewReuseIdentifier(), for: indexPath) as! SettingTableViewCell
        cell.titleLabel.text = interactor?.optionTitle(indexPath)
        
        let icon = UIImage(named: "IcoOption_Selected")?.withRenderingMode(.alwaysTemplate)
        cell.statusIcon.tintColor = UIColor.blue
        cell.statusIcon.image = icon
        cell.statusIcon.isHidden = !((interactor?.optionSelected(indexPath))!)

        return cell
    }

    func numberOfSections() -> Int {
        return (interactor?.numberOfSections())!
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return (interactor?.numberOfOptions(section))!
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
    func sectionViewReuseIdentifier() -> String {
        return "SettingSectionView"
    }
    
    func tableViewReuseIdentifier() -> String {
        return "SettingTableCell"
    }
}

extension SettingsPresenter: InterfaceSettingsInteractorOutput {
    func sectionToggled() {
        delegate.updateData()
    }
    
    func optionSelected() {
        delegate.updateData()
    }
}
