//
//  FirstViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/13/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import FirebaseDatabase


class FirstViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    var ref: FIRDatabaseReference!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create search bar:
        createSearchBar()
//        if let username = UserDefaults.standard.value(forKey: "username") {
////            welcomeBackLabel.text = "Welcome, \(username)!"
//        }
        
        //set up firebase:
        ref = FIRDatabase.database().reference()
        fetchWhiskey()

    }
    
    func createSearchBar() {
        searchBar.placeholder = "Search whiskeys"
        searchBar.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func fetchWhiskey() {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dismiss the keyboard after typing:
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

