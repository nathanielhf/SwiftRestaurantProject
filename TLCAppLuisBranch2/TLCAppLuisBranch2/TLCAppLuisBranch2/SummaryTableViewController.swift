//
//  SummaryTableViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-08-06.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit

class SummaryTableViewController: UITableViewController {
    
    //This array has the lines to be shown in the table view
    var printArray = [String]()
    
    //This function adds the lines in printArray to the table view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in summary.sumItems{
            printArray.append("\(item.quantity) X \(item.name) @ $\(String(format: "%.2f", item.price)): $\(String(format: "%.2f", item.price * Double(item.quantity)))")
            //print(item.name)
        }
        printArray.append("Subtotal: $\(String(format : "%.2f", summary.subtotal))")
        printArray.append("Tax: $\(String(format : "%.2f", summary.taxes))")
        printArray.append("Total: $\(String(format : "%.2f", summary.total))")
        //print("subtotal \(summary.subtotal)\nTax \(summary.taxes)\nTotal \(summary.total)")
        
    }

    //This function returns the number of elements in printArray
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return newOrder!.items.count
        return printArray.count
    }
    
    //This function returns each line in printArray
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        cell.textLabel?.text = printArray[indexPath.row]
        
        return cell
        
    }
    
    //This function may do something in the future
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myIndex = indexPath.row
    }

}
