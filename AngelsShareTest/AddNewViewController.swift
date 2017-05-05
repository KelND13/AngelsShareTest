//
//  AddNewViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 5/5/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newWhiskey: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Keyboard dismissal functions:
    @IBAction func dissmissKeyboard(_ sender: UITapGestureRecognizer) {
        newWhiskey.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ newWhiskey: UITextField) -> Bool {
        newWhiskey.resignFirstResponder()
        return true
    }
    
    // Add new whiskey functionality:
    
    @IBAction func add(_ sender: Any) {
        // Alert the user that the action worked:
        let successAlert = UIAlertController(title: "Success!", message: "New whiskey added", preferredStyle: .alert)
        let dismissal = UIAlertAction(title: "OK", style: .default, handler: nil)
        successAlert.addAction(dismissal)
        present(successAlert, animated: true, completion: nil)
        
    }
    
    // Cancel and dismiss the modal view:
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
