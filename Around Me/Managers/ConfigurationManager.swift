//
//  ConfigurationManager.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    // MARK: - Init
    override init() {
        super.init()
    }
    
    private let fileName = "Configuration"
    
    // MARK: - Public methods
    func retrieveDataFromPlist(_ key: String) -> Any {
        let configurationFile = pathConfigurationFile()
        if openConfigurationFile(configurationFile) {
            if let data = NSDictionary(contentsOfFile: configurationFile) {
                return data[key] as Any
            } else {
                return ""
            }
        }
        return ""
    }

    func saveStringToPlist(_ key: String, value: String) {
        let configurationFile = pathConfigurationFile()
        if let data = NSMutableDictionary(contentsOfFile: configurationFile) {
            data[key] = value
            data.write(toFile: configurationFile, atomically: false)
        }
    }

    func saveBoolToPlist(_ key: String, value: Bool) {
        let configurationFile = pathConfigurationFile()
        if let data = NSMutableDictionary(contentsOfFile: configurationFile) {
            data[key] = value
            data.write(toFile: configurationFile, atomically: false)
        }
    }

    func saveBoolToPlist(_ primaryKey: String, index: Int, secondaryKey: String, value: Bool) {
        let configurationFile = pathConfigurationFile()
        if let data = NSMutableDictionary(contentsOfFile: configurationFile) {
            ((data[primaryKey] as! NSArray)[index] as! NSMutableDictionary)[secondaryKey] = value
            data.write(toFile: configurationFile, atomically: false)
        }
    }

    // MARK: - Private methods
    private func pathConfigurationFile() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        return documentsDirectory.appendingPathComponent("\(fileName).plist")
    }
    
    private func openConfigurationFile(_ configurationFile: String) -> Bool {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: configurationFile) {
            guard let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist") else {
                return false
            }
            do {
                try fileManager.copyItem(atPath: bundlePath, toPath: configurationFile)
                return true
            } catch let error as NSError {
                print(error.localizedDescription)
                return false
            }
        }
        return true
    }
}
