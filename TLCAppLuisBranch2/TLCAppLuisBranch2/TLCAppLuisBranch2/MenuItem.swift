//
//  MenuItem.swift
//  TLCAppLuisBranch2
//
//  Created by Vladimir Vatsurin on 2019-07-24.
//  Copyright © 2019 Vladimir Vatsurin. All rights reserved.
//  Purpose of the class: this class is for providing a data structure with information about specific items selected by users.

import Foundation

class MenuItem {
    
    public var name: String = "" //The name of the item
    public var description: String = "" //The description of the item
    public var price: Double = 0.0 //The price of the item
    public var quantity: Int = 1 //The selected quantity of the item
   
    //This initializer takes defined values but quantity is set to 1 for convenience
    public init?(name: String, description: String, price: Double){
        self.name = name
        self.description = description
        self.price = price
        self.quantity = 1
    }
    
    //This initializer requires all fields of the object
    public init?(name: String, description: String, price: Double, quantity: Int){
        self.name = name
        self.description = description
        self.price = price
        self.quantity = quantity
    }
}
