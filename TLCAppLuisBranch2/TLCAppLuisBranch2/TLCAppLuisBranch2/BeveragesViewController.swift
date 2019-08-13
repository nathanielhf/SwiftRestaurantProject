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

var beverages = ["martini", "coke", "pepsi", "tequila", "rum"]
var beverageDescriptions = ["Shaken, not stirred", "Better than pepsi, allegedly", "Not as good as coke, allegedly", "Tequila has prebiotics", "For the pirates"]
var beveragePrices = [12.5, 2.5, 2.5, 7.5, 9.5]
var beverageIndex : Int?

var foods = ["hamburger", "cheeseburger", "bacon wrapped shrimp", "grilled shrimp", "pizza"]
var foodDescriptions = ["Made with juicy ground beef", "Same as the hamburger but with cheese on top", "Shrimp wrapped in slices of bacon", "Shrimp with no bacon", "Bread with tomato sauce and cheese on top"]
var foodPrices =  [11.99, 12.99, 12.88, 11.34, 12.34]
var foodIndex : Int?

var stateVarTable = "DefaultStateVarTable";

var summary = Summary()



class BeveragesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var newOrder : Order?
    
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
        seatingTable?.code = stateVarTable
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
    
    
    @IBAction func reviewOrder(_ sender: UIButton) {
        summary = Summary(order : newOrder!, table : seatingTable!)!
    }
}
