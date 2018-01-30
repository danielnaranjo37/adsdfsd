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
    
    
    var stringNames: [String]
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
        
        stringNames = ManzanaArray.toStrings(apples: names)
        fileStoredName = fileName
        DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        ArchiveURL = DocumentsDirectory.appendingPathComponent(fileName)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stringNames, forKey: Properties.stringNames)
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let temp = aDecoder.decodeObject(forKey: Properties.stringNames) as? [String] else {
            os_log("Unable to decode stuff.", log: OSLog.default, type: .debug)
            return nil
            
        }
        
        self.init(names: ManzanaArray.toManzanas(strs: temp), fileName: Properties.fileStoredName)
    }
    
    func archiveString(str: [Manzana]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(stringNames, toFile: ArchiveURL.path)
        if isSuccessfulSave {
            os_log("String successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save String...", log: OSLog.default, type: .error)
        }
    }
    
    func restoreString() -> [Manzana]  {
        let tmp = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURL.path) as? [String]
        return ManzanaArray.toManzanas(strs: tmp!)
    }
    
    static func toStrings(apples: [Manzana]) -> [String] {
        var things: (color: String, brillo: String, durabilidad: String)
        var out: [String] = [] //1D array, one for each Manzana
        for apple in apples {
            things = apple.getValues()
            out.append(things.color + "," + things.brillo + "," + things.durabilidad + ";")
        }
        return out
    }
    
    static func toManzanas(strs: [String]) -> [Manzana] {
        var out: [Manzana]! = [] //1D array, one for each line
        for str in strs {
            var temp = str
            var apple = Manzana()
            
            var ind =  temp.index(of: ",")
            var range = temp.startIndex..<ind
            apple.color = temp.substring(with: range)
            temp.removeSubrange(range)
            temp.remove(at: temp.startIndex) //remove the comma
            
            ind =  temp.index(of: ",")
            range = temp.startIndex..<ind
            apple.brillo = temp.substring(with: range)
            temp.removeSubrange(range)
            temp.remove(at: temp.startIndex) //remove the comma
            
            ind =  temp.index(of: ";")
            range = temp.startIndex..<ind
            apple.durabilidad = temp.substring(with: range)
            temp.removeSubrange(range)
            temp.remove(at: temp.startIndex) //remove the semicolon
            
            out.append(apple)
        }
        return out
    }
    
}


