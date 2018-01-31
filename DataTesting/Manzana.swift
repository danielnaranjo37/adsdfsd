//
//  Manzana.swift
//  DataTesting
//
//  Created by Daniel e. Naranjo Sampson on 1/24/18.
//  Copyright © 2018 NARANJO, DANIEL. All rights reserved.
//

import Foundation

class Manzana: NSObject, Codable {
    
    struct Apple: Codable {
        var color: String
        var brillo: String
        var durabilidad: String
    }

    var color: String
    var brillo: String
    var durabilidad: String
    
    static var jsonData: Data!
    static var json: Any?
    
    init(color: String, brillo: String, durabilidad: String){
        self.color = color
        self.brillo = brillo
        self.durabilidad = durabilidad
    }
    

    
    func getValues() -> (String,String,String) {
        return  (self.color,self.brillo,self.durabilidad)
    }
}
