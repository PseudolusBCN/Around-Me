//
//  SettingsInterfaces.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

protocol InterfaceSettingsViewController: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}

protocol InterfaceSettingsPresenter: class {
    var router: InterfaceSettingsRouter? { get set }
    var interactor: InterfaceSettingsInteractor? { get set }
    var view: InterfaceSettingsViewController? { get set }
    
    func setupTableView(_ tableView: UITableView, viewController: UIViewController)
    func settingSectionView(_ tableView: UITableView, section: Int) -> SettingSectionView
    func optionTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> SettingTableViewCell
    func numberOfSections() -> Int
    func numberOfRows(_ section: Int) -> Int
    func sectionExpanded(_ section: Int) -> Bool
    func optionSelected(_ indexPath: IndexPath) -> Bool
    
    func toggleSection(_ section: Int)
    func selectOption(_ indexPath: IndexPath)
}

protocol InterfaceSettingsPresenterOutput: class {
    func updateData()
}

protocol InterfaceSettingsInteractor: class {
    var presenter: InterfaceSettingsPresenter? { get set }

    func numberOfSections() -> Int
    func numberOfOptions(_ section: Int) -> Int
    func sectionTitle(_ section: Int) -> String
    func optionValue(_ indexPath: IndexPath) -> String
    func sectionExpanded(_ section: Int) -> Bool
    func optionSelected(_ indexPath: IndexPath) -> Bool
    
    func toggleSection(_ section: Int)
    func selectOption(_ indexPath: IndexPath)
}

protocol InterfaceSettingsInteractorOutput: class {
    func sectionToggled()
    func optionSelected()
}

protocol InterfaceSettingsRouter: class {
    var presenter: InterfaceSettingsPresenter? { get set }
}
