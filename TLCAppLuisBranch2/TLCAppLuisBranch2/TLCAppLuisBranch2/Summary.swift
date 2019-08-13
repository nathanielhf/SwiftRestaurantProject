//
//  Summary.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafana on 2019-08-07.
//  Copyright © 2019 Luis Villafana. All rights reserved.
//  Purpose of the class: this class is for providing a data structure that stores information about the order for a restaurant customer, including the order with its items, the subtotal price of the order, the taxes, and the total price of the order.

import Foundation


class Summary {
    
    var sumItems = [MenuItem](); //These are the items in the order of the summary
    var subtotal: Double = 0; //This is the price before taxes
    var taxes: Double = 0; //These are the taxes of the order
    var total: Double = 0; //These is the total price of the order
    var tableCode: String?; //This is the code for the table that has the order for a summary
    
    //Summarie should be associated with an order and its table
    public init?(order: Order, table: SeatingTable){
        
        self.sumItems = order.items;
        
        for item in order.items{
            self.subtotal += item.price * Double(item.quantity);
        }
        
        self.tableCode = table.code!;
        
        self.taxes += self.subtotal * 0.13;
        
        self.total = self.subtotal + self.taxes;
    }
    
    //A default summary object can also be initialized for convenience
    public init(){}
    
}
