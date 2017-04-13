//
//  FirstViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/13/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up search bar:
//        func createSearchBar() {
//            searchBar.showsCancelButton = false
//            searchBar.placeholder = "Search whiskeys"
//            searchBar.delegate = self
//            
//            self.navigationItem.titleView = searchBar
//        }
//        
//        // creates the search bar when the app loads:
//        createSearchBar()
        
        func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarTextDidEndEditing(searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

