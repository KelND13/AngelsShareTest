//
//  SearchTableViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/17/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    let searchBar = UISearchBar()
    let tableData = ["Oban", "Mckenzie", "Four Roses", "Whistlepig"]
    
    // Variables for searching:
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    var handle: FIRAuthStateDidChangeListenerHandle?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the searchbar view:
        
        createSearchBar()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func createSearchBar() {

        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions for adding search functionality:
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = tableData.filter({ (whiskeys: String) -> Bool in
                return whiskeys.range(of: searchText) != nil
        })
        
        if searchText != "" {
            shouldShowSearchResults = true
            self.tableView.reloadData()
        } else {
            shouldShowSearchResults = false
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if shouldShowSearchResults {
            return filteredArray.count
        } else {
            return tableData.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        
        if shouldShowSearchResults {
            cell.textLabel?.text = filteredArray[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = tableData[indexPath.row]
            return cell
        }
    }
    
    // Dismiss the searchbar keyboard two ways:
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
        
        
    }
    
    //Firebase authentication
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [START auth_listener]
        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            // [START_EXCLUDE]
//            self.setTitleDisplay(user)
//            self.tableView.reloadData()
            // [END_EXCLUDE]
        }
        // [END auth_listener]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        FIRAuth.auth()?.removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
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
