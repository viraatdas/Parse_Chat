//
//  ViewController.swift
//  Parse_Chat
//
//  Created by Viraat Das on 2/19/20.
//  Copyright © 2020 Viraat Das. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginAction(_ sender: Any) {
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        
        if username == "" || password == "" {
            let message = "Username or password is empty"
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            

            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
        
        else {
            PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                if let error = error {
                    print("User log in failed: \(error.localizedDescription)")
                } else {
                    print("User logged in successfully")
                    // display view controller that needs to shown after successful login
                    //self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
    }
    
   
    
}

