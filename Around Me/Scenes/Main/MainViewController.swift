//
//  MainViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainViewController: UIViewController, InterfaceMainViewController {
    var presenter: InterfaceMainPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupObservers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        HUDManager().showProgressHUD(title: "generic.hud.updatingLocation".localized)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        presenter?.removeObservers()
    }
}
