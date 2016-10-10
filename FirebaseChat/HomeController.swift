//
//  ViewController.swift
//  FirebaseChat
//
//  Created by Mikheil Gotiashvili on 10/6/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UITableViewController {

    let baseURL = FIRDatabase.database().reference(fromURL: "https://fir-chat-b00c1.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleLogout))
        
        let newMessageButtonIcon = UIImage(named: "new_message_icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: newMessageButtonIcon, style: .plain, target: self, action: #selector(openNewMessageView))
        
        setupUsersData()
        
    }
    
    func setupUsersData(){
            
            guard let userID = FIRAuth.auth()?.currentUser?.uid else { return }
            
            baseURL.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                
                    if let value = snapshot.value as? NSDictionary {
                        let userName = value["name"] as? String
                        self.navigationItem.title = userName
                    }
                
                }, withCancel: { (error) in
                    print(error.localizedDescription)
            })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleLogout(){
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    
    func openNewMessageView(){
        let newMessageController = NewMessageController()
        let rootController = UINavigationController(rootViewController: newMessageController)
        present(rootController, animated: true, completion: nil)
    }

}

