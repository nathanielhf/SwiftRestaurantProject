//
//  Order.swift
//  TLCAppLuisBranch2
//
//  Created by Nathaniel Fisher on 2019-07-24.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import Foundation

class Order {
    //var Quantity: Int?
    // items array takes tuple with values MenuItem (a food/beverage object) and Quantity
    var items = [MenuItem]()
    
    public init?() {
        self.items = []
    }
    
    // add item function
    func addItem(_ newItem: MenuItem){
        if (newItem.name == ""){
            print("name property of \(newItem) is blank")
        }
        else if (newItem.description == ""){
            print("description property of \(newItem) is blank")
        }
        else if (newItem.price < 0.0){
            print("price property of \(newItem) is negative")
        }
        
        // if items does not contain a MenuItem with given name, append new MenuItem
        // else if items already contains given MenuItem, increment quantity
    
        let indexOfItem = items.firstIndex(where: { $0.name == newItem.name})
        if (indexOfItem != nil) {
            items[indexOfItem!].quantity += newItem.quantity
        }
        else {
            items.append(newItem)
        }
       
    }
    // remove item function
        // if reaches 0, remove item from items array
}
