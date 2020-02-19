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
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    }
    

 
    
    
}

