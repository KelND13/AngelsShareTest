//
//  SearchTableViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/17/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import CoreData

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    let searchBar = UISearchBar()
    var tableData = [Whiskey]()
    
    // Variables for searching:
//    var filteredArray = [String]()
//    var shouldShowSearchResults = false
    
    // Variables for core data:
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var faveWhiskeyTable: [FaveWhiskeys] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the searchbar view:
        
        createSearchBar()
        
        
        // Prepares table for loading core data:
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getWhiskeys()
        tableView.reloadData()
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
    
    
    // Core data fetcher:
    func getWhiskeys() {
        do {
            faveWhiskeyTable = try context.fetch(FaveWhiskeys.fetchRequest())
        } catch {
            print("Fetch failed")
        }
        
        tableView.reloadData()
    }
    
    
    // Functions for adding search functionality:
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let whiskey = faveWhiskeyTable[indexPath.row]
        
        if let newWhiskey = whiskey.name {
            cell.textLabel?.text = newWhiskey
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return faveWhiskeyTable.count
        
    }

    // Deletes a saved favorite whiskey from Core Data:
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let whiskey = faveWhiskeyTable[indexPath.row]
            context.delete(whiskey)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                faveWhiskeyTable = try context.fetch(FaveWhiskeys.fetchRequest())
            } catch {
                print("Fetch failed")
            }
        }
    
        tableView.reloadData()
    }
        
    // Dismiss the searchbar keyboard two ways:
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
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
