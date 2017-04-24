//
//  OnboardingViewController.swift
//  
//
//  Created by Kelly Dickerson on 4/20/17.
//
//

import UIKit
import Firebase

class OnboardingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.email.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func `continue`(_ sender: UIButton) {
        
        UserDefaults.standard.set(username.text, forKey: "username")
        UserDefaults.standard.set(email.text, forKey: "email")
        
        if let email = email.text {
            if let password = password.text {
                
        //firebase create user:
                FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                    // ...
                }
        }
        }
        
        performSegue(withIdentifier: "toMainSegue", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
