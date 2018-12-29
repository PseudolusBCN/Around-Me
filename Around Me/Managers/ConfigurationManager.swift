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
    func retrieveStringFromPlist(_ key: String) -> String {
        let configurationFile = pathConfigurationFile()
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: configurationFile) {
            guard let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist") else {
                return ""
            }
            do {
                try fileManager.copyItem(atPath: bundlePath, toPath: configurationFile)
            } catch let error as NSError {
                print("Error generando plist: \(error.localizedDescription)")
                return ""
            }
        }
        
        if let data = NSDictionary(contentsOfFile: configurationFile) {
            return data[key] as! String
        } else {
            print("Error leyendo plist")
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
    
    // MARK: - Private methods
    private func pathConfigurationFile() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString

        return documentsDirectory.appendingPathComponent("\(fileName).plist")
    }
}
