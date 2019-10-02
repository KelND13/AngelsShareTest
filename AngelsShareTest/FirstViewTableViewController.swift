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
        "Ancient Age, Bourbon",
        "Angel's Envy Bourbon",
        "Angel's Envy Carribean Rum Cask Finish, Rye",
        "Angel's Envy Cask Strength",
        "Angel’s Envy Port Finish",
        "Ardbeg 10",
        "Ardbeg Uigeadail",
        "Ardmore, Single Malt Scotch",
        "Arran, Scotch",
        "Auchentoshan American Oak",
        "Auchentoshan Three Wood, Scotch",
        "Auchentoshan 12 yr, Single Malt",
        "Aultmore 12 yr",
        "Backwoods Whiskey",
        "Backwoods Pecan Whiskey",
        "Backwoods Sweet Cinnamon Whiskey",
        "Backwoods Vanilla Cream Whiskey",
        "Backwoods Pecan Pie",
        "Bain's",
        "Baker's",
        "Balvenie 12yr Doublewood",
        "Balvenie 14yr Caribbean Cask, Scotch",
        "Balvenie 12yr Single Barrel First Fill Bourbon",
        "Balvenie 17yr Doublewood",
        "Balvenie 21yr Portwood",
        "Basil Hayden",
        "Barterhouse, Bourbon",
        "Belle Meade, Bourbon",
        "Benromach 10yr Old",
        "Benromach Peat Smoke, Scotch",
        "Bernheim, Wheat Whiskey",
        "Bird Dog Whiskey",
        "Black Bottle",
        "Black Dirt, Bourbon",
        "Blade and Bow, Bourbon",
        "Blanton's, Bourbon",
        "Booker's Bluegrass",
        "Bowmore 12yr, Single Malt Scotch",
        "Bowmore 15yr, Scotch",
        "Breckenridge, Bourbon",
        "Bruichladdich Classic, Scotch",
        "Bruichladdich, Single Malt Scotch",
        "Buchanan's",
        "Buffalo Trace, American whiskey",
        "Bulleit Bourbon",
        "Bulleit 10yr",
        "Bulleit Rye",
        "Bunnahabhain 12yr, Scotch",
        "Bunnahabhain 18yr",
        "Bunnahabhain 25yr",
        "Bushmills, Irish whisky",
        "Calumet Farms Bourbon",
        "Caol 12yr, Scotch",
        "Caribou Crossing",
        "Cody Road, Bourbon",
        "Cody Road, Rye",
        "Corsair Ryemageddon, Rye",
        "Corsair Triple Smoke, American Whiskey",
        "Cragganmore 12yr, Scotch",
        "Craigellachie 13yr, Scotch",
        "Crown Royal Black",
        "Crown Royal Deluxe",
        "Crown Royal Northern Harvest Rye",
        "Crown Royal Reserve",
        "Crown Royal Vanilla",
        "Dalmore 12yr, Single Malt Scotch",
        "Dalmore 15yr, Single Malt Scotch",
        "Dalwhinnie 15yr, Scotch",
        "Defiance Whiskey",
        "Dewars, Blended Scotch",
        "Drunken Sailor, Irish Whiskey",
        "Eagle Rare, Bourbon",
        "Elijah Craig, Bourbon",
        "Elijah Craig Small Batch, Bourbon",
        "Elmer T. Lee, Bourbon",
        "Evan Williams Single Barrel",
        "Evan Williams Honey",
        "Evan Williams Peach",
        "Evan Williams Black",
        "Evan Williams White Label",
        "Evan Williams 1783",
        "Four Roses Single Barrel, Bourbon",
        "Four Roses Small Batch",
        "Four Roses Yellow Label",
        "Garrison Brothers, Bourbon",
        "Gentleman Jack, American Whiskey",
        "GlenDronach 12yr, Scotch",
        "Glenfarclas 10 yr, Scotch",
        "Glenfarclas 17 yr, Scotch",
        "Glenfiddich 12yr, Single Malt Scotch",
        "Glenfiddich 14yr Bourbon Barrel Reserve",
        "Glenfiddich 15yr Solera VAT",
        "Glenfiddich 18yr Reserve",
        "Glenfiddich 21yr Gran Reserva",
        "Glenlivet 12yr, Single Malt Scotch",
        "Glenlivet 15yr, Single Malt Scotch",
        "Glenlivet 18yr, Single Malt Scotch",
        "Glenlivet Founders Reserve",
        "Glenmorangie Original, Single Malt Scotch",
        "Glenmorangie La Santa",
        "Glenmorangie Quinta Ruban",
        "Glenmorangie Nectar d'Or",
        "Glenrothes Sherry Cask Strength, Scotch",
        "Glenrothes Vintage Reserve, Scotch",
        "Glen Scotia, Double Cask, Scotch",
        "George Dickel Barrel Select, American Whiskey",
        "George Dickel, Rye",
        "Hellcat Maggie Irish Whiskey",
        "Henry McKenna, Bourbon",
        "Hibiki Harmony, Japanese Whiskey",
        "Highland Park 12yr, Scotch",
        "Highland Park 15yr, Scotch",
        "High West American Prairie Bourbon",
        "High West Double Rye, Rye",
        "High West Rendezvous Rye, Rye",
        "High West Campfire",
        "High West 36th Vote Barrel Aged Manhattan",
        "Hillrock Solera, Bourbon",
        "Hirsch Small Batch, Bourbon",
        "Hudson Baby Bourbon",
        "Hudson Manhattan Rye",
        "Hudson 4 Grain Bourbon",
        "Hudson Single Malt",
        "Hudson Maple Cask Rye",
        "Hudson Monkey Shoulder",
        "I. W. Harper, Bourbon",
        "Jack Daniel's Tennessee Whiskey, American Whiskey",
        "Jack Daniel's Honey",
        "Jack Daniel's Fire",
        "Jack Daniel's Gentleman Jack",
        "Jack Daniel's Single Barrel Select",
        "Jack Daniel's Single Barrel Rye",
        "James E. Pepper 1776, Rye",
        "Jameson, Irish whisky",
        "Jefferson's Ocean, Bourbon",
        "Jefferson's Reserve, Bourbon",
        "Jefferson's Very Small Batch, Bourbon",
        "Jim Beam Rye",
        "Jim Beam Black",
        "Jim Beam Double Oak",
        "Jim Beam Bonded",
        "Jim Beam Devil's Cut",
        "Jim Beam Single Barrel",
        "Jim Beam Apple",
        "Jim Beam Honey",
        "Jim Beam Kentucky Fire",
        "Jim Beam High Rye",
        "Jim Beam Wheat",
        "John J. Bowman, Bourbon",
        "Johnnie Walker Double Black",
        "Johnnie Black",
        "Johnnie Walker Gold",
        "Johnnie Walker Red",
        "Jura Superstition, Scotch",
        "Kilbeggan, Irish whisky",
        "Kilchoman Sanaig, Scotch",
        "King's County, Bourbon",
        "King's County Corn Whiskey, American Whiskey",
        "King's County American Single Malt, American Whiskey",
        "Knob Creek 9yr",
        "Knob Creek Rye",
        "Knob Creek Single Barrel",
        "Lagavulin, Single Malt Scotch",
        "Laphroaig 10yr, Scotch",
        "Laphroaig 10yr Cask Strength, Scotch",
        "Laphroaig 15yr, Scotch",
        "Laphroaig Triple Wood, Scotch",
        "Larceny, Bourbon",
        "Linkwood 15yr, Scotch",
        "Lock, Stock & Barrel, Rye",
        "Macallan, Single Malt Scotch",
        "Maker's Mark, American whiskey",
        "Maker's 46, Bourbon",
        "Maker's Cask Strength, Bourbon",
        "Masterson's 10yr, Rye",
        "McKenzie, Bourbon",
        "Michter's, Rye",
        "Michter's Barrel Strength, Rye",
        "Michter's American Whiskey, American Whiskey",
        "Michter's Sour Mash, American Whiskey",
        "Mulligan’s Bourbon",
        "Nikka Coffey Grain",
        "Nikka Coffey Malt",
        "Noah's Mill, Bourbon",
        "Oban 14, Single Malt Scotch",
        "Octomore, Scotch",
        "Old Forester",
        "Old Forester 100",
        "Old Forester 1870",
        "Old Forester 1897",
        "Old Forester Birthday Bourbon",
        "Old Grand-Dad 114, Bourbon",
        "Old Potrero, Rye",
        "Old Pulteney 12yr, Scotch",
        "Pendergast's Royal Gold Bourbon",
        "Pendleton Canadian Whisky",
        "Pendleton Midnight Canadian Whisky",
        "Pendleton 1910 Rye Whisky",
        "Port Charlotte Scottish Barley, Scotch",
        "Rittenhouse, Rye",
        "Rough Rider, Bourbon",
        "Russell's Reserve 6yr, Rye",
        "Russell's Reserve 10yr, Bourbon",
        "Rebel Yell 10yr Single Barrel",
        "Sazerac, Rye",
        "Scapa Skiren, Scotch",
        "Speyburn 10yr",
        "Springbank 10yr, Scotch",
        "Stranahans",
        "Stranahans Diamond Peak",
        "Taketsuru, Japanese whiskey",
        "Talisker 10yr, Scotch",
        "Talisker Storm, Single Malt Scotch",
        "Templeton Rye 4yr",
        "Templeton Rye 6yr",
        "Templeton Rye 10yr",
        "Town Branch, Bourbon",
        "Tullamore Dew, Irish whisky",
        "Westland Original, American Whiskey",
        "WhistlePig 10yr, Rye",
        "WhistlePig Old World, Rye",
        "Wild Turkey 101 Bourbon",
        "Wild Turkey 81 Bourbon",
        "Wild Turkey Rare Breed",
        "Wild Turkey Kentucky Spirit",
        "Wild Turkey Rye",
        "Wild Turkey 101 Rye",
        "Wild Turkey American Honey",
        "Willet 3yr, Rye",
        "Willet Pot Still, Bourbon",
        "W. L. Weller Special Reserve, Bourbon",
        "Woodford Reserve, Rye",
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
