//
//  NewMessageController.swift
//  FirebaseChat
//
//  Created by Mikheil Gotiashvili on 10/8/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    fileprivate let usersCellId = "usersCellId"
    let usersTableRef = FIRDatabase.database().reference(fromURL: "https://fir-chat-b00c1.firebaseio.com/").child("users")
    
    var usersArray = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        tableView.register(UserViewCell.self, forCellReuseIdentifier: usersCellId)
        
        fetchUsersData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var usersDataDict = NSDictionary()
    
    func fetchUsersData(){
        
        usersTableRef.observe(.value, with: { (snapshot) in
            
            if let users = snapshot.value as? [String : AnyObject] {

                for (_, userData) in users {
                    
                    guard let userEmail = userData["email"], let userName = userData["name"] else { return }
                    
                    var user = User()
                    user.email = userEmail as? String
                    user.name = userName as? String
                    if let profileImage = userData["profileImage"] {
                        user.profileImage = profileImage as? String
                    }
                    
                    self.usersArray.append(user)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
            }) { (error) in
                print(error.localizedDescription)
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: usersCellId, for: indexPath) as! UserViewCell

        let user = usersArray[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        if let profileImage = user.profileImage {
            
            cell.profileImage.imageCacheFromURLString(imageName: profileImage)
            
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func handleCancel(){
        dismiss(animated: true, completion: nil)
    }


}
