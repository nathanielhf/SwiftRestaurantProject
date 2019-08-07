//
//  Beverages2ViewController.swift
//  TLCAppLuisBranch
//
//  Created by Luis Villafaña Tamez on 2019-07-20.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

//google searched xcode table view inside of regular view controller

import UIKit

//Constants and stuff, these could be grouped into other data structures, such as tuples and/or dictionaries
var newOrder = Order()
var seatingTable = SeatingTable(code: "DEFAULT");
var selectedName : String?
var selectedPrice : Double?
var selectedDesc : String?
var testItems : [String] = []

var beverages = ["martini", "coke", "pepsi", "tequila", "rum", "cointreau", "mezcal", "merlot", "pinot grigio", "daiquiri"]
var beverageDescriptions = ["lorem ipsum", "lorem lorem", "ipsum", "lorem lorem", "ipsum", "lorem ipsum", "lorem lorem", "ipsum", "lorem lorem", "ipsum"]
var beveragePrices = [2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5]
var beverageIndex : Int?

var foods = ["hamburger", "cheeseburger", "bacon burger", "bacon wrapped shrimp", "grilled shrimp", "fish and chips", "pizza"]
var foodDescriptions = ["0", "1", "2", "3", "4", "5", "6"]
var foodPrices =  [11.99, 12.99, 12.88, 11.34, 12.34, 11.34, 12.34]
var foodIndex : Int?

var stateVarTable = "DefaultStateVarTable";



class BeveragesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var newOrder : Order?
    
    var seatingTable = SeatingTable(code: "DEFAULT");
    
    @IBOutlet weak var tableBeverages: UITableView!
    
    @IBOutlet weak var tableFoods: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize food data
        foodIndex = nil
        beverageIndex = nil
        selectedDesc = ""
        selectedName = ""
        selectedPrice = nil
        stateVarTable = seatingTable!.code!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count : Int?
        // return the number of rows
        
        if tableView == self.tableBeverages{
            //return beverages.count
            count = beverages.count
        }
        
        else if tableView == self.tableFoods{
            count = foods.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.tableBeverages{
            cell = tableView.dequeueReusableCell(withIdentifier: "beverageCell", for: indexPath)
            cell!.textLabel?.text = beverages[indexPath.row]
        }
        
        else if tableView == self.tableFoods{
            cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
            cell!.textLabel?.text = foods[indexPath.row]
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView == self.tableBeverages{
            foodIndex = nil
            beverageIndex = indexPath.row
            selectedName = beverages[beverageIndex!]
            selectedDesc = beverageDescriptions[beverageIndex!]
            selectedPrice = beveragePrices[beverageIndex!]
        }
        else if tableView == self.tableFoods{
            foodIndex = indexPath.row
            beverageIndex = nil
            selectedName = foods[foodIndex!]
            selectedDesc = foodDescriptions[foodIndex!]
            selectedPrice = foodPrices[foodIndex!]
        }
        //performSegue(withIdentifier: "foodSegue", sender: self)
    }
}
