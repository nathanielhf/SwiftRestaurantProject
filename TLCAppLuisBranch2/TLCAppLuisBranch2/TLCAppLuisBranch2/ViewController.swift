//
//  ViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-07-20.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit


//let newOrder = Order()
class ViewController: UIViewController {
    
    //These are variables for storing the current table number
    @IBOutlet weak var tableField: UITextField!
    var tableCode: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //This is a function that will be implemented if an array of table objects is implemented in state memory
    @IBAction func beginOrder(_ sender: Any) {
        // array (tuple? Dictionary?) holding all food in order
        // each index has name, description, price, and quantity of a food or beverage item
        // this is passed to itemView on segue
        // itemView can increase quantity of item or remove it from DS altogether
        // .... I want this to be similar to an array of objects
        
//        if let destinationVC = segue.destination as? BeveragesViewController {
//            destinationVC.newOrder = self.newOrder
//        }
        tableCode = tableField.text
    }
    
    //This function is for passing information
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let TempVC:BeveragesViewController = segue.destination as! BeveragesViewController
        TempVC.seatingTable!.code = tableField.text!;
    }*/
    
}

