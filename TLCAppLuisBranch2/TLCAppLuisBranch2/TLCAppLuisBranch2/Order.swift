//
//  Order.swift
//  TLCAppLuisBranch2
//
//  Created by Nathaniel Fisher on 2019-07-24.
//  Copyright © 2019 Nathaniel Fisher. All rights reserved.
//  Purpose of this class: this class will serve as a data structure that will contain information about the items selected by a user

import Foundation

class Order {
    // items array takes tuple with values MenuItem (a food/beverage object) and Quantity
    var items = [MenuItem]()
    
    //This initializes an empty order because orders are initially empty
    public init?() {
        self.items = []
    }
    
    //This function adds a new item to an order object
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
        // else if items already contains given MenuItem, update quantity
    
        let indexOfItem = items.firstIndex(where: { $0.name == newItem.name})
        if (indexOfItem != nil) {
            //items[indexOfItem!].quantity += newItem.quantity
            items[indexOfItem!].quantity = newItem.quantity
        }
        else {
            items.append(newItem)
        }
    }
}
