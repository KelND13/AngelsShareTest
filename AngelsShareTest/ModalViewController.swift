//
//  ModalViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/27/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var dataDisplay: UILabel!
    var dataDisplayName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataDisplay.text = dataDisplayName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        
       
    }

    // Dismissses the modal view:
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
