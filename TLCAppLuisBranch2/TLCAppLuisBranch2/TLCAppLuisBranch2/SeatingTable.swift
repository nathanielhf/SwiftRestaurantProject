//
//  SeatingTable.swift
//  TLCAppLuisBranch2
//
//  Created by Steven Caird on 2019-08-07.
//  Copyright © 2019 Steven Caird. All rights reserved.
//  Purpose of the class: this class associates restaurant tables to orders, because restaurants can have many tables, each with a different bill to pay.

import Foundation

class SeatingTable{
    
    //Each table has an identifying code
    var code: String?;
    //Each table has its own order
    var ord = Order();

    //Each table is initialized with a code for identification purposes
    public init?(code: String) {
        self.code = code;
    }
    
    
    
}
