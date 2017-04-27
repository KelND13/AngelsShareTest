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
    var whiskeyList: [String] = ["Oban, Single Malt Scotch",
        "Tullamore Dew, Irish whisky",
        "Jameson, Irish whisky",
        "Bushmills, Irish whisky",
        "Kilbeggan, Irish whisky",
        "Glenfiddich, Single Malt Scotch",
        "Glenlivet, Single Malt Scotch",
        "Highland Park, Single Malt Scotch",
        "Laphroaig, Single Malt Scotch",
        "Macallan, Single Malt Scotch",
        "Dalmore, Single Malt Scotch",
        "Glenmorangie, Single Malt Scotch",
        "Talisker, Single Malt Scotch",
        "Lagavulin, Single Malt Scotch",
        "Glenrothes, Single Malt Scotch",
        "Johnnie Walker, Blended Scotch",
        "Dewars, Blended Scotch",
        "Jim Beam, American whiskey",
        "Wild Turkey, American whiskey",
        "Knob Creek, American whiskey",
        "Maker's Mark, American whiskey",
        "Jack Daniels, American whiskey",
        "Bulleit, American whiskey",
        "Woodford Reserve, American whiskey",
        "Buffalo Trace, American whiskey",
        "Four Roses, American whiskey",
        "High West Double Rye, Rye",
        "Taketsuru, Japanese whiskey",
        "Bruichladdich, Single Malt Scotch"
    ]
    
    //variables for searching:
   // var ref: FIRAuthStateDidChangeListenerHandle?
    var filteredDict = [String]()
    var shouldShowResults = false
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createWhiskeySearchBar()
        
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
            cell.textLabel?.text = nil
            return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
