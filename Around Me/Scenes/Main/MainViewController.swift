//
//  MainViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainViewController: BaseViewController, InterfaceMainViewController {
    var presenter: InterfaceMainPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        hideNavBar()

        presenter?.setupObservers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //presenter?.showHUD("generic.hud.updatingLocation".localized)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //presenter?.removeObservers()
    }

//    @objc private func locationUnauthorized() {
//    }
    
    deinit {
    }
}
