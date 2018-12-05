//
//  ConfigurationManager.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    override init() {
        super.init()
    }
    
    func retrieveStringFromPlist(_ key: String) -> String {
        if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"), let plist = FileManager.default.contents(atPath: path) {
            do {
                let pListData = try PropertyListSerialization.propertyList(from: plist, options: [], format: nil) as! [String:AnyObject]
                return pListData[key] as! String
            } catch {
                print("Error leyendo plist: \(error)")
            }
        }
        return ""
    }
}
