//
//  FiltersViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 30/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, InterfaceFiltersViewController {
    var presenter: InterfaceFiltersPresenter?

    // MARK: - Init
    init() {
        super.init(nibName: "FiltersViewController", bundle: nil)

        setLocalizedTitles()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "IcoBack"), style: .plain, target: self, action: #selector(closeView))

//        
//        tabBarItem.image = UIImage(named:"IcoList")
//        setLocalizedTitles()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "IcoFilter"), style: .plain, target: self, action: #selector(goToFilters))
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(setLocalizedTitles), name: NSNotification.Name(rawValue: notificationLanguageChanged), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private methods
    @objc private func setLocalizedTitles() {
        navigationItem.title = "main.appName".localized
    }

    @objc private func closeView() {
        presenter?.closeView()
    }
}

extension FiltersViewController: InterfaceFiltersPresenterOutput {
}
