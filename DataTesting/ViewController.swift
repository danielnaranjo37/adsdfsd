//
//  ViewController.swift
//  DataTesting
//
//  Created by NARANJO, DANIEL on 1/18/18.
//  Copyright © 2018 NARANJO, DANIEL. All rights reserved.
//

import UIKit

class ThisView: UIViewController {
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var brillo: UILabel!
    @IBOutlet weak var durabilidad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manzana = Manzana()
        let coder = NSKeyedArchiver()
        let arr = ManzanaArray(names: [manzana], fileName: "manzanita")!
        arr.encode(with: coder)
        arr.archiveString(str: [manzana])
        coder.finishEncoding()
        let manzanas = arr.restoreString()
        let manzanita = manzanas[0]
        color.text = manzanita.color
        brillo.text = manzanita.brillo
        durabilidad.text = manzanita.durabilidad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

