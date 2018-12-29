//
//  HUDManager.swift
//  Around Me
//
//  Created by Miquel Masip on 09/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import MBProgressHUD

class HUDManager: NSObject {
    private static var instance: HUDManager?

    var backgroundView: UIView?

    // MARK: - Singleton
    class func sharedInstance() -> HUDManager {
        guard let currentInstance = instance else {
            instance = HUDManager()
            return instance!
        }
        return currentInstance
    }
    
    class func clearInstance() {
        instance = nil
    }

    // MARK: - Init
    override init() {
        super.init()
    }

    // MARK: - Public methods
    func showProgressHUD(_ view: UIView) {
        _ = createHUD(title: "", subtitle: "")
    }

    func showProgressHUD(title: String) {
        _ = createHUD(title: title, subtitle: "")
    }

    func showProgressHUD(subtitle: String) {
        _ = createHUD(title: "", subtitle: subtitle)
    }

    func showProgressHUD(title: String, subtitle: String) {
        _ = createHUD(title: title, subtitle: subtitle)
    }

    func hideProgressHUD() {
        MBProgressHUD.hide(for: (UIApplication.topViewController()?.view)!, animated: true)
        removeBackgroundView()
    }

    // MARK: - Private methods
    private func createHUD(title: String, subtitle: String) -> MBProgressHUD {
        hideProgressHUD()
        createBackgroundView()

        let hud = MBProgressHUD.showAdded(to: (UIApplication.topViewController()?.view)!, animated: true)
        hud.mode = .indeterminate
        hud.isUserInteractionEnabled = false

        if title.count > 0 {
            hud.label.text = title
        }
        if subtitle.count > 0 {
            hud.detailsLabel.text = subtitle
        }

        return hud
    }
    
    private func createBackgroundView() {
        backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView?.backgroundColor = UIColor.black
        backgroundView?.alpha = 0.5
        UIApplication.topViewController()?.view.addSubview(backgroundView!)
    }
    
    private func removeBackgroundView() {
        if backgroundView != nil {
            backgroundView?.removeFromSuperview()
        }
    }
}
