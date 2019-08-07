//
//  Summary.swift
//  TLCAppLuisBranch2
//
//  Created by Vladimir Vatcurin on 2019-08-07.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import Foundation


class Summary {
    
    var sunItems = [MenuItem]();
    var subtotal: Double = 0;
    var taxes: Double = 0;
    var total: Double = 0;
    var tableCode: String?;
    
    public init?(order: Order, table: SeatingTable){
        
        self.sunItems = order.items;
        
        for item in order.items{
            self.subtotal += item.price * Double(item.quantity);
        }
        
        self.tableCode = table.code!;
        
        self.taxes += self.subtotal * 0.13;
        
        self.total = self.subtotal + self.taxes;
    }
    
}
