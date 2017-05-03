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

    @IBOutlet weak var dataDisplay: UILabel!
    var dataDisplayName = String()
    
    //core data for favorites list:
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // set color of label:
        dataDisplay.backgroundColor = UIColor(red: 2.0/255.0, green: 172.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataDisplay.text = dataDisplayName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        
        let successAlert = UIAlertController(title: "Success!", message: "Added to favorites", preferredStyle: .alert)
        let dismissal = UIAlertAction(title: "OK", style: .default, handler: nil)
        successAlert.addAction(dismissal)
        present(successAlert, animated: true, completion: nil)
        
        //save:
        let entityDescription = NSEntityDescription.entity(forEntityName: "FaveWhiskeys", in: managedObjectContext)
        let fave = FaveWhiskeys(entity: entityDescription!, insertInto: managedObjectContext)
        
        fave.name = dataDisplay.text
        
        do {
            try managedObjectContext.save()
            dataDisplay.text = ""
            print("Saved")
        } catch {
            print("Error")
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
