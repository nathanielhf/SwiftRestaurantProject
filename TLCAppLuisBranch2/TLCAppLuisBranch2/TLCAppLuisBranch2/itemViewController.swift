//Group number 3

//  itemViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-07-24.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit

class itemViewController: UIViewController {

    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemDescription: UITextView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemQuantity: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        itemName.text = selectedName
        itemPrice.text = String(format: "%.2f", selectedPrice!)
        itemDescription.text = selectedDesc
    }

}
