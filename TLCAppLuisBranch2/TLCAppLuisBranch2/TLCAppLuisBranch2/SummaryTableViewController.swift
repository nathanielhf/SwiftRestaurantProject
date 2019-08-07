//
//  SummaryTableViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-08-06.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit

class SummaryTableViewController: UITableViewController {
    
    var printArray = [String]()
    
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

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return newOrder!.items.count
        return printArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        //cell.textLabel?.text = "\(newOrder!.items[indexPath.row].quantity) \(newOrder!.items[indexPath.row].name) @ $\(newOrder!.items[indexPath.row].price)"
        cell.textLabel?.text = printArray[indexPath.row]
        
        return cell
        
    } // end func
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myIndex = indexPath.row
        //performSegue(withIdentifier: "segue", sender: self)
    }

}
