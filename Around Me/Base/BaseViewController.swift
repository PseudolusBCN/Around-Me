//
//  BaseViewController.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
    var backgroundView: UIView?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print(String(describing: self))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation Bar
    func showNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - MBProgressHUD
    private func createHUD() -> MBProgressHUD {
        hideProgressHUD()
        
        backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView?.backgroundColor = UIColor.black
        backgroundView?.alpha = 0.5
        self.view.addSubview(backgroundView!)

        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.isUserInteractionEnabled = false
        
        return hud
    }
    
    func showProgressHUD() {
        _ = createHUD()
    }

    func showProgressHUD(title: String) {
        let hud = createHUD()
        hud.label.text = title
    }

    func showProgressHUD(subtitle: String) {
        let hud = createHUD()
        hud.detailsLabel.text = subtitle
    }

    func showProgressHUD(title: String, subtitle: String) {
        let hud = createHUD()
        hud.label.text = title
        hud.detailsLabel.text = subtitle
    }

    func hideProgressHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
        backgroundView?.removeFromSuperview()
    }
}
