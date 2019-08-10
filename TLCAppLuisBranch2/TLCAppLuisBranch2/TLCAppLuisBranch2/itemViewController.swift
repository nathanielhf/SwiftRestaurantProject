//Group number 3

//  itemViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-07-24.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit

class itemViewController: UIViewController {

    var accessedController : ViewController = ViewController(nibName: nil, bundle: nil)
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemDescription: UITextView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemQuantity: UITextField!
    
    @IBOutlet weak var quantityStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // populate itemQuantity text field with quantity of item
        itemQuantity.text = "0"
        quantityStepper.value = 0
        //Change quantity if item is already in order
        for item in newOrder!.items {
            
            if item.name == selectedName {
                itemQuantity.text = String(item.quantity)
                quantityStepper.value = Double(item.quantity)
            }
        }
        
        itemName.text = selectedName
        itemPrice.text = String(format: "%.2f", selectedPrice!)
        itemDescription.text = selectedDesc

    }
    
    @IBAction func stepperItemQuantity(_ sender: UIStepper) {
        itemQuantity.text = String(format: "%.0f", sender.value)
        
    }
    // add function to change quantity of item
    // and create new object of item if doesn't exist
    
    // do we need to send the object back using a segue? perhaps it can simply be added to an Order object instatiated in a different file
    @IBAction func btnConfirmItem(_ sender: UIButton) {
        let quantity: Int = Int(itemQuantity.text!)!
        
        if (quantity >= 1){
            let newItem = MenuItem(name: selectedName!, description: selectedDesc!, price: selectedPrice!, quantity: quantity)
            newOrder?.addItem(newItem!)
        }
        
        if (quantity == 0){
            let n1 = newOrder!.items.count
            for n0 in 0..<n1{
                if (newOrder!.items[n1 - n0 - 1].name == selectedName){
                    newOrder!.items.remove(at: n1 - n0 - 1)
                }
            }
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func reviewOrder(_ sender: UIButton) {
        summary = Summary(order : newOrder!, table : seatingTable!)!
    }
}
