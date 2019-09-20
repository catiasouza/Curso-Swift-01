//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Catia Miranda de Souza on 19/09/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!

    @IBAction func add(){
        
        let name = nameField.text
        let happiness = happinessField.text
        
        print("Eaten \(name) with happines \(happiness)!")
    }

}

