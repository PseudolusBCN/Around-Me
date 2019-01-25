//
//  FiltersViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, InterfaceFiltersViewController {
    @IBOutlet weak var filtersTableView: UITableView!
    
    var presenter: InterfaceFiltersPresenter?

    // MARK: - Init
    init() {
        super.init(nibName: "FiltersViewController", bundle: nil)

        setLocalizedTitles()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "IcoBack"), style: .plain, target: self, action: #selector(closeView))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.setupTableView(filtersTableView, viewController: self)
    }
    
    // MARK: - Private methods
    @objc private func setLocalizedTitles() {
        navigationItem.title = "main.appName".localized
    }

    @objc private func closeView() {
        presenter?.closeView()
    }
}

extension FiltersViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return (presenter?.numberOfSections())!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = presenter?.filterTableViewCell(tableView, indexPath: indexPath) {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.selectFilter(indexPath)
    }
}

extension FiltersViewController: InterfaceFiltersPresenterOutput {
    func updateData() {
        filtersTableView.reloadData()
    }
}
