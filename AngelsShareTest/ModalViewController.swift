//
//  ModalViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 4/27/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import CoreData


class ModalViewController: UIViewController {

    @IBOutlet weak var addToFavorites: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var dataDisplay: UILabel!
    var dataDisplayName = String()
    

    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // set color of label:
        dataDisplay.backgroundColor = UIColor(red: 38.0/255.0, green: 172.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        addToFavorites.backgroundColor = UIColor.green
        cancel.backgroundColor = UIColor.red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataDisplay.text = dataDisplayName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        
        //Link UILabel to core data model:
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newFaveWhiskey = FaveWhiskeys(context: context)
        newFaveWhiskey.name = dataDisplay.text
        
        //Save to core data:
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Dismiss the view:
        let successAlert = UIAlertController(title: "Success!", message: "Added to favorites", preferredStyle: .alert)
        self.present(successAlert, animated: true, completion: nil)
        
        let time = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: time) {
            successAlert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // Save to core data:
    func saveToFavorites(name: String) {
    
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
