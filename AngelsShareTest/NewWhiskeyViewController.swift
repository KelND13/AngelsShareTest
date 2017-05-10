//
//  NewWhiskeyViewController.swift
//  AngelsShareTest
//
//  Created by Kelly Dickerson on 5/9/17.
//  Copyright © 2017 Kelly Dickerson. All rights reserved.
//

import UIKit

class NewWhiskeyViewController: UIViewController {
    
    @IBOutlet weak var newWhiskeyTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        // Core data??
        
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //dismiss keyboard
    
    func dismissKeyboard(newWhiskeyTextField: UITextField) {
        newWhiskeyTextField.endEditing(true)
        resignFirstResponder()
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
