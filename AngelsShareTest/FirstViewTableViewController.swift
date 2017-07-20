//
//  FirstViewTableViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/25/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirstViewTableViewController: UITableViewController, UISearchBarDelegate {
    
    let whiskeySearchBar = UISearchBar()
    
    var modalLabelValue: String!
    
    var whiskeyList: [String] = [
        "Aberfeldy 12 yr",
        "Aberlour 12 yr",
        "Aberlour Abundah",
        "Alberta Rye",
        "Amador Whiskey",
        "Amador Double Barrel",
        "Angel’s Envy Port Finish",
        "Ardbeg 10",
        "Ardbeg Uigeadail",
        "Ardmore",
        "Auchentoshan American Oak",
        "Auchentoshan Three Wood",
        "Auchentoshan 12 yr",
        "Aultmore 12 yr",
        "Backwoods Whiskey",
        "Backwoods Pecan Whiskey",
        "Backwoods Sweet Cinnamon Whiskey",
        "Backwoods Vanilla Cream Whiskey",
        "Backwoods Pecan Pie",
        "Bain's",
        "Baker's",
        "Balvenie 12yr Doublewood",
        "Balvenie 14yr Caribbean Cask",
        "Balvenie 12yr Single Barrel First Fill Bourbon",
        "Balvenie 17yr Doublewood",
        "Balvenie 21yr Portwood",
        "Basil Hayden",
        "Belle Meade",
        "Benromach 10yr Old",
        "Bernheim",
        "Bird Dog Whiskey",
        "Black Bottle",
        "Blanton's",
        "Booker's Bluegrass",
        "Bowmore 12yr",
        "Breckenridge",
        "Bruichladdich",
        "Buchanan's",
        "Buffalo Trace",
        "Bulleit Bourbon",
        "Bulleit 10yr",
        "Bulleit Rye",
        "Bunnahabhain 12yr",
        "Bunnahabhain 18yr",
        "Bunnahabhain 25yr",
        "Bushmills",
        "Calumet Farms Bourbon",
        "Caribou Crossing",
        "Cody Road, Bourbon",
        "Cody Road, Rye",
        "Crown Royal Black",
        "Crown Royal Deluxe",
        "Crown Royal Northern Harvest Rye",
        "Crown Royal Reserve",
        "Crown Royal Vanilla",
        "Dalmore 12yr",
        "Dalmore 15yr",
        "Defiance Whiskey",
        "Dewars",
        "Drunken Sailor Irish Whiskey",
        "Elijah Craig",
        "Evan Williams Single Barrel",
        "Evan Williams Honey",
        "Evan Williams Peach",
        "Evan Williams Black",
        "Evan Williams White Label",
        "Evan Williams 178",
        "Four Roses Single Barrel",
        "Four Roses Small Batch",
        "Four Roses Yellow Label",
        "Garrison Brothers",
        "Glenfiddich 12yr",
        "Glenfiddich 14yr Bourbon Barrel Reserve",
        "Glenfiddich 15yr Solera VAT",
        "Glenfiddich 18yr Reserve",
        "Glenfiddich 21yr Gran Reserva",
        "Glenlivet 12yr",
        "Glenlivet 15yr",
        "Glenlivet 18yr",
        "Glenlivet Founders Reserve",
        "Glenmorangie Original",
        "Glenmorangie Lasanta",
        "Glenmorangie Quinta Ruban",
        "Glenmorangie Nectar d'Or",
        "Glenrothes",
        "Hellcat Maggie Irish Whiskey",
        "Highland Park",
        "High West American Prairie Bourbon",
        "High West Double Rye",
        "High West Rendezvous Rye",
        "High West Campfire",
        "High West 36th Vote Barrel Aged Manhattan",
        "Hudson Baby Bourbon",
        "Hudson Manhattan Rye",
        "Hudson 4 Grain Bourbon",
        "Hudson Single Malt",
        "Hudson Maple Cask Rye",
        "Hudson Monkey Shoulder",
        "Jack Daniel's",
        "Jack Daniel's Honey",
        "Jack Daniel's Fire",
        "Jack Daniel's Gentleman Jack",
        "Jack Daniel's Single Barrel Select",
        "Jack Daniel's Single Barrel Rye",
        "Jameson",
        "Jim Beam Rye",
        "Jim Beam Black",
        "Jim Beam Double Oak",
        "Jim Beam Bonded",
        "Jim Beam Devil's Cut",
        "Jim Beam Single Barrel",
        "Jim Beam Apple",
        "Jim Beam Honey",
        "Jim Beam Kentucky Fire",
        "Johnnie Walker Double Black",
        "Johnnie Black",
        "Johnnie Walker Gold",
        "Johnnie Walker Red",
        "Kilbeggan",
        "Knob Creek 9yr",
        "Knob Creek Rye",
        "Knob Creek Single Barrel",
        "Lagavulin",
        "Laphroaig",
        "Macallan",
        "Maker's Mark",
        "Mulligan’s Bourbon",
        "Nikka Coffey Grain",
        "Nikka Coffey Malt",
        "Oban 14",
        "Old Forester",
        "Old Forester 100",
        "Old Forester 1870",
        "Old Forester 1897",
        "Old Forester Birthday Bourbon",
        "Pendergast's Royal Gold Bourbon",
        "Pendleton Canadian Whisky",
        "Pendleton Midnight Canadian Whisky",
        "Pendleton 1910 Rye Whisky",
        "Rebel Yell 10yr Single Barrel",
        "Speyburn 10yr",
        "Stranahans",
        "Stranahans Diamond Peak",
        "Taketsuru",
        "Talisker Storm",
        "Templeton Rye 4yr",
        "Templeton Rye 6yr",
        "Templeton Rye 10yr",
        "Tullamore Dew",
        "WhistlePig 10yr Straight Rye Whiskey",
        "WhistlePig 12yr Old World Series",
        "Wild Turkey 101 Bourbon",
        "Wild Turkey 81 Bourbon",
        "Wild Turkey Rare Breed",
        "Wild Turkey Kentucky Spirit",
        "Wild Turkey Rye",
        "Wild Turkey 101 Rye",
        "Wild Turkey American Honey",
        "Woodford Reserve",
        "Woodford Reserve Double Oaked",
        "Woodford Reserve Reserve Rye",
        "Woodford Reserve Masters Series"
    ]
    
    //variables for searching:
   // var ref: FIRAuthStateDidChangeListenerHandle?
    var filteredDict = [String]()
    var shouldShowResults = false
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createWhiskeySearchBar()
        
        //self.tableView.backgroundColor = UIColor(red: 178.0/255.0, green: 101.0/255.0, blue: 51.0/255.0, alpha: 1.0)
               
    }

    
    func createWhiskeySearchBar() {
        
        whiskeySearchBar.showsCancelButton = false
        whiskeySearchBar.placeholder = "Search whiskeys"
        whiskeySearchBar.delegate = self
        
        self.navigationItem.titleView = whiskeySearchBar
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDict = whiskeyList.filter({ (whiskeys: String) -> Bool in
            return whiskeys.range(of: searchText) != nil
        })
        
        if searchText != "" {
            shouldShowResults = true
            self.tableView.reloadData()
        } else {
            shouldShowResults = false
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if shouldShowResults {
            return filteredDict.count
        } else {
            return whiskeyList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        if shouldShowResults {
            cell.textLabel?.text = filteredDict[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = whiskeyList[indexPath.row]
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Whiskeys"
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red: 15.0/255.0, green: 172.0/255.0, blue: 178.0/255.0, alpha: 1.0)
    }
    
    //Segue handlers:
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toModalView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toModalView" {
            let newVC = segue.destination as! ModalViewController
            let tableIndex = tableView.indexPathForSelectedRow?.row
            
            // if user uses search, display modal view from the filtered list
            // if user does not use search, display from the unfiltered list
            if shouldShowResults == true {
                newVC.dataDisplayName = filteredDict[tableIndex!]
            } else {
                newVC.dataDisplayName = whiskeyList[tableIndex!]
            }
        }
    }
    
    
    
    // Dismiss the searchbar keyboard two ways:
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        whiskeySearchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //shouldShowSearchResults = true
        whiskeySearchBar.endEditing(true)
        self.tableView.reloadData()
        
        
    }
   



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
 
}
