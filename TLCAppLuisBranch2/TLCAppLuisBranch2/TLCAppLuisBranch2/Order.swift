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
    var items = [(MenuItem: MenuItem, Quantity: Int)]()
    
    // add item function
    func addItem(_ newItem: MenuItem){
        if (newItem.name == ""){
            print("name property of \(newItem) is blank")
        }
        else if (newItem.description == ""){
            print("description property of \(newItem) is blank")
        }
        else if (newItem.price! < 0.0){
            print("price property of \(newItem) is negative")
        }
        
        // if items does not contain a MenuItem with given name, append new MenuItem
        // else if items already contains given MenuItem, increment quantity
        else {
            var indexOfItem = items.in
            if (find())
//            var alreadyInOrder: Bool = false
//
//            for item in items {
//                if (item.MenuItem.name == newItem.name) {
//                    alreadyInOrder = true
//                }
//            }
//
//            if alreadyInOrder == false {
//                items.append((newItem, 1))
//            }
//            else {
//                items[newItem.name]
//            }
            
        }
       
    }
    
    // remove item function
        // if reaches 0, remove item from items array
}
