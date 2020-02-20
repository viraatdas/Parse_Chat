//
//  ChatViewController.swift
//  Parse_Chat
//
//  Created by Pallav Agarwal on 2/19/20.
//  Copyright © 2020 Viraat Das. All rights reserved.
//

import UIKit
import Parse



class ChatViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    

    @IBOutlet weak var chatMessageField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
    
        
        // construct query
        let query = PFQuery(className: "Messages")
        query.addDescendingOrder("createdAt")

        
    }
    
    
    @IBAction func sendAction(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = chatMessageField.text ?? ""
        
        chatMessage.saveInBackground { (success, error) in
           if success {
              print("The message was saved!")
           } else if let error = error {
              print("Problem saving message: \(error.localizedDescription)")
           }
        }
        
    }
    
    @objc func onTimer() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return
    }
    
}
