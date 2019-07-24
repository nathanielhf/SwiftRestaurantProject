//
//  MenuItem.swift
//  TLCAppLuisBranch2
//
//  Created by Nathaniel Fisher on 2019-07-24.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import Foundation

class MenuItem {
    
    // has name, description, and price
    public var name: String?
    public var description: String?
    public var price: Double?
    public var quantity: Int?
   
    public init?(name: String, description: String, price: Double){
        self.name = name
        self.description = description
        self.price = price
        self.quantity = 1
    }
}
