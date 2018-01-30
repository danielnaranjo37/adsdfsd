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
    
    var manzanas: [Manzana] = []
    var yesNo = -1
    var arr: ManzanaArray!
    
    @IBAction func theButton(_ sender: Any) {
        manzanas = arr.restoreString()
        yesNo *= -1
        if yesNo > 0 {
            let manzanita = manzanas[0]
            color.text = manzanita.color
            brillo.text = manzanita.brillo
            durabilidad.text = manzanita.durabilidad
            return
        }
        else {
            let manzanita = manzanas[1]
            color.text = manzanita.color
            brillo.text = manzanita.brillo
            durabilidad.text = manzanita.durabilidad
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manzana = Manzana()
        manzana.color = "black like my soul"
        manzana.brillo = "dark as all hell"
        manzana.durabilidad = "like a baby butt"
        let manzana2 = Manzana()
        
        let coder = NSKeyedArchiver()
        arr = ManzanaArray(names: [manzana,manzana2], fileName: "manzanita")!
        
        arr.encode(with: coder)
        arr.archiveString(str: [manzana])
        coder.finishEncoding()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

}

