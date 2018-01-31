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
    var manzana1: Manzana!
    var data: Data!
    @IBAction func theButton(_ sender: Any) {
        let apple = try? JSONDecoder().decode(Manzana.Apple.self, from: data)
        let manzana2 = Manzana(color: (apple?.color)!, brillo: (apple?.brillo)!, durabilidad: (apple?.durabilidad)!)
        color.text = manzana2.color
        brillo.text = manzana2.brillo
        durabilidad.text = manzana2.durabilidad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manzana1 = Manzana(color:"black like my soul", brillo: "dark as all hell", durabilidad: "like a baby butt" )
        let apple = Manzana.Apple(color: manzana1.color, brillo: manzana1.brillo, durabilidad: manzana1.durabilidad)
        data = try? JSONEncoder().encode(apple)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

}

