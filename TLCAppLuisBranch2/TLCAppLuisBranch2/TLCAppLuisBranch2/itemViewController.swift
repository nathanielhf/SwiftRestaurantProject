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
    
    //These are all view elements
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
        
        //Populate view elements with elected item information:
        itemName.text = selectedName
        itemPrice.text = String(format: "%.2f", selectedPrice!)
        itemDescription.text = selectedDesc
        itemImage.image = UIImage(named: selectedName! + ".jpeg")

    }
    
    //This function displays the selected quantity of the item
    @IBAction func stepperItemQuantity(_ sender: UIStepper) {
        itemQuantity.text = String(format: "%.0f", sender.value)
        
    }
    
    //This function grabs the selected quantity of the current item and adds the item with its selected quantity to the current order
    @IBAction func btnConfirmItem(_ sender: UIButton) {
        let quantity: Int = Int(itemQuantity.text!)!
        
        if (quantity >= 1){
            let newItem = MenuItem(name: selectedName!, description: selectedDesc!, price: selectedPrice!, quantity: quantity)
            newOrder?.addItem(newItem!)
        }
        
        //Items can be removed from the order by setting the quantity to 0
        if (quantity == 0){
            let n1 = newOrder!.items.count
            for n0 in 0..<n1{
                if (newOrder!.items[n1 - n0 - 1].name == selectedName){
                    newOrder!.items.remove(at: n1 - n0 - 1)
                }
            }
        }
        //After the order is confirmed, the menu view is displayed
        _ = navigationController?.popViewController(animated: true)
    }
    
    //This function initializes a new summary object with all items order by the user so far
    @IBAction func reviewOrder(_ sender: UIButton) {
        summary = Summary(order : newOrder!, table : seatingTable!)!
    }
}
