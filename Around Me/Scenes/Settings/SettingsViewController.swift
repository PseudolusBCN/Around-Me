//
//  SettingsViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Localize

class SettingsViewController: UIViewController, InterfaceSettingsViewController {
    var presenter: InterfaceSettingsPresenter?
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    // MARK: - Init
    init() {
        super.init(nibName: "SettingsViewController", bundle: nil)

        UINavigationBar.appearance().backgroundColor = UIColor.hexString("#FF8000")

        navigationItem.title = "main.appName".localized
        setLocalizedTitles()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLocalizedTitles), name: NSNotification.Name(rawValue: notificationLanguageChanged), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupTableView(settingsTableView, viewController: self)
    }

    // MARK: - Private methods
    @objc private func setLocalizedTitles() {
        tabBarItem.title = "main.tabBar.settings".localized
        tabBarItem.image = UIImage(named:"IcoSettings")
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return (presenter?.numberOfSections())!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.sectionExpanded(section))! ? (presenter?.numberOfRows(section))! : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = presenter?.settingSectionView(tableView, section: section) {
            header.delegate = self
            return header
        }
        return UIView()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = presenter?.optionTableViewCell(tableView, indexPath: indexPath) {
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.selectOption(indexPath)
    }
}

extension SettingsViewController: SettingSectionViewDelegate {
    func toggleSection(_ header: SettingSectionView, section: Int) {
        presenter?.toggleSection(section)
    }
}

extension SettingsViewController: InterfaceSettingsPresenterOutput {
    func updateData() {
        settingsTableView.reloadData()
    }
}
