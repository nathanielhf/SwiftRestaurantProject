//
//  Beverages2ViewController.swift
//  TLCAppLuisBranch
//
//  Created by Luis Villafaña Tamez on 2019-07-20.
//  Copyright © 2019 Luis Villafaña Tamez. All rights reserved.
//

//google searched xcode table view inside of regular view controller

import UIKit

var newOrder = Order() //This is the current order object that will have the ordered items
var seatingTable = SeatingTable(code: "DEFAULT"); //Seating table should be passed from the first view
var stateVarTable = "DefaultStateVarTable"; //This is a default table number
var summary = Summary() //This is an empty order summary object that will be populated with the items ordered by the user

//The following variables are for storing user selected parameters
var selectedName : String?
var selectedPrice : Double?
var selectedDesc : String?
var beverageIndex : Int?
var foodIndex : Int?

//The following variables are for storing application related constants
let beverages = ["martini", "coke", "pepsi", "tequila", "rum"]
let beverageDescriptions = ["Shaken, not stirred", "Better than pepsi, allegedly", "Not as good as coke, allegedly", "Tequila has prebiotics", "For the pirates"]
let beveragePrices = [12.5, 2.5, 2.5, 7.5, 9.5]

let foods = ["hamburger", "cheeseburger", "bacon wrapped shrimp", "grilled shrimp", "pizza"]
let foodDescriptions = ["Made with juicy ground beef", "Same as the hamburger but with cheese on top", "Shrimp wrapped in slices of bacon", "Shrimp with no bacon", "Bread with tomato sauce and cheese on top"]
let foodPrices =  [11.99, 12.99, 12.88, 11.34, 12.34]

class BeveragesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableBeverages: UITableView! //This table has beverage names
    
    @IBOutlet weak var tableFoods: UITableView! //This table has food names
    
    //This funciton is executed when the menu view loads
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
    
    //This function returns the number of rows in each table view
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
    
    //This function populates the cells in each table with food or beverage names
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
    
    //This function saves the information about the item selected by the user
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
    }
    
    //This function initializes a new summary object with all items order by the user so far
    @IBAction func reviewOrder(_ sender: UIButton) {
        summary = Summary(order : newOrder!, table : seatingTable!)!
    }
}
