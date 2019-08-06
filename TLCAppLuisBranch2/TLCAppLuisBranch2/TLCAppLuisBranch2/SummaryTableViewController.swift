//
//  SummaryTableViewController.swift
//  TLCAppLuisBranch2
//
//  Created by Luis Villafaña Tamez on 2019-08-06.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

import UIKit

class SummaryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newOrder!.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(newOrder!.items[indexPath.row].quantity) \(newOrder!.items[indexPath.row].name) @ \(newOrder!.items[indexPath.row].price)"
        
        return cell
        
    } // end func
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myIndex = indexPath.row
        //performSegue(withIdentifier: "segue", sender: self)
    }

}
