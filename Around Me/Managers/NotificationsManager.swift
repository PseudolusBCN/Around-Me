//
//  NotificationsManager.swift
//  Around Me
//
//  Created by Miquel Masip on 06/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class NotificationsManager: NSObject {
    override init() {
        super.init()
    }
    
    func sendNotification(_ name: String) {
        let notification = Notification(name: Notification.Name(rawValue: name), object: nil)
        NotificationCenter.default.post(notification)
    }
}
