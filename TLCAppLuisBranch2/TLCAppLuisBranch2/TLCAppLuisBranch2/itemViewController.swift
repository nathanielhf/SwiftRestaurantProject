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
        
        // if item is already in order
        // populate itemQuantity text field with quantity of item
        for item in newOrder!.items {
            if item.name == selectedName {
                itemQuantity.text = String(item.quantity)
                quantityStepper.value = Double(item.quantity)
            }
            else {
                itemQuantity.text = "0"
                quantityStepper.value = 0
            }
        }
        
        itemName.text = selectedName
        itemPrice.text = String(format: "%.2f", selectedPrice!)
        itemDescription.text = selectedDesc
        
        
        /*
        print(quantityStepper.value)
        print(foodIndex == nil)
        print(beverageIndex == nil)
        print(accessedController.newOrder?.items)
        print(testItems)
        */
    }
    
    @IBAction func stepperItemQuantity(_ sender: UIStepper) {
        itemQuantity.text = String(format: "%.0f", sender.value)
        
    }
    // add function to change quantity of item
    // and create new object of item if doesn't exist
    
    // do we need to send the object back using a segue? perhaps it can simply be added to an Order object instatiated in a different file
    @IBAction func btnConfirmItem(_ sender: UIButton) {
        let quantity: Int = Int(itemQuantity.text!)!
        
        // if one item, add 1 item to newOrder array (quantity defaults to 1)
        if (quantity == 1) {
            let newItem = MenuItem(name: selectedName!, description: selectedDesc!, price: selectedPrice!)
            
            // if item is already in newOrder, set quantity to 1
            
            newOrder?.addItem(newItem!)
        }
        // else set quantity of newItem to stepper-specified quantity
        else if (quantity > 1) {
            let newItem = MenuItem(name: selectedName!, description: selectedDesc!, price: selectedPrice!, quantity: quantity)

            /**
             still need to add: if item is already in newOrder, set quantity to quantityStepper.value
             if it IS 0, remove item from order
             */
            newOrder?.addItem(newItem!)
        }
        /*
        for item in newOrder!.items{
            print("\(item.quantity) \(item.name)")
        }*/
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func reviewOrder(_ sender: UIButton) {
        summary = Summary(order : newOrder!, table : seatingTable!)!
    }
}
