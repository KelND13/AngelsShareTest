//
//  NewWhiskeyViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 5/9/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit
import CoreData

class NewWhiskeyViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newWhiskeyTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewWhiskeyViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(newWhiskeyTextField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func add(_ sender: Any) {
        // Links data model to core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newWhiskey = FaveWhiskeys(context: context)
        newWhiskey.name = newWhiskeyTextField.text
        
        // Saves to core data:
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
        
        //Dismiss the view:
        let successAlert = UIAlertController(title: "Success!", message: "Added to your whiskeys", preferredStyle: .alert)
        self.present(successAlert, animated: true, completion: nil)
        
        let time = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: time) {
            successAlert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
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
