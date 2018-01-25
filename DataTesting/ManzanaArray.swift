//
//  PersistentStringArray.swift
//  ScrollTest
//
//  Created by behnke on 6/24/17.
//  Copyright © 2017 George K Behnke. All rights reserved.
//

import Foundation
import os.log

class ManzanaArray: NSObject, NSCoding {
    
    
    var stringNames: [Manzana]
    var fileStoredName: String
    
    struct Properties { //strings to find the data after encoding
        static let stringNames = "stringNames"
        static let fileStoredName = "fileStoredName"
        static let color = "color"
        static let brillo = "brillo"
        static let durabilidad = "durabilidad"
    }
    
    var DocumentsDirectory: URL
    var ArchiveURL: URL
    
    
    init?(names: [Manzana], fileName: String) {
        guard !names.isEmpty else {
            return nil
        }
        
        stringNames = names
        fileStoredName = fileName
        DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        ArchiveURL = DocumentsDirectory.appendingPathComponent(fileName)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stringNames, forKey: Properties.stringNames)
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let names = aDecoder.decodeObject(forKey: Properties.stringNames) as? [Manzana] else {
            os_log("Unable to decode stuff.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(names: names, fileName: Properties.fileStoredName)
    }
    
    func archiveString(str: [Manzana]) {
        stringNames = str
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(stringNames, toFile: ArchiveURL.path)
        if isSuccessfulSave {
            os_log("String successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save String...", log: OSLog.default, type: .error)
        }
    }
    
    func restoreString() -> [Manzana]?  {
        let tmp = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURL.path) as? [Manzana]
        return tmp
    }
}


