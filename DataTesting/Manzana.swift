//
//  Manzana.swift
//  DataTesting
//
//  Created by Daniel e. Naranjo Sampson on 1/24/18.
//  Copyright © 2018 NARANJO, DANIEL. All rights reserved.
//

import Foundation

class Manzana: Codable {
    var color: String
    var brillo: String
    var durabilidad: String

    init(){
        self.color = "rojo"
        self.brillo = "brillante"
        self.durabilidad = "suavecito"
    }
    
    func getValues() -> (String,String,String) {
        return  (self.color,self.brillo,self.durabilidad)
    }
}
