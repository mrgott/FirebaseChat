//
//  LoginViewController.swift
//  FirebaseChat
//
//  Created by Mikheil Gotiashvili on 10/6/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.rgb(red: 61, green: 91, blue: 151, alpha: 1)
        
        view.addSubview(formView)
        
        formView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        formView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        formView.addSubview(nameForm)
        formView.addSubview(emailForm)
        formView.addSubview(passwordForm)
        
        nameForm.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameForm.topAnchor.constraint(equalTo: formView.topAnchor).isActive = true
        nameForm.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16).isActive = true
        nameForm.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16).isActive = true
        
        emailForm.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailForm.topAnchor.constraint(equalTo: nameForm.bottomAnchor).isActive = true
        emailForm.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16).isActive = true
        emailForm.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16).isActive = true
        
        passwordForm.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordForm.topAnchor.constraint(equalTo: emailForm.bottomAnchor).isActive = true
        passwordForm.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16).isActive = true
        passwordForm.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16).isActive = true
        
        formView.addSubview(nameSeparator)
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        nameSeparator.bottomAnchor.constraint(equalTo: nameForm.bottomAnchor).isActive = true
        nameSeparator.leadingAnchor.constraint(equalTo: formView.leadingAnchor).isActive = true
        nameSeparator.trailingAnchor.constraint(equalTo: formView.trailingAnchor).isActive = true
        
        formView.addSubview(emailSeparator)
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailSeparator.bottomAnchor.constraint(equalTo: emailForm.bottomAnchor).isActive = true
        emailSeparator.leadingAnchor.constraint(equalTo: formView.leadingAnchor).isActive = true
        emailSeparator.trailingAnchor.constraint(equalTo: formView.trailingAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let formView: UIView = {
        let formView = UIView()
        formView.backgroundColor = .white
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.layer.cornerRadius = 5
        formView.layer.masksToBounds = true
        
        return formView
    }()
    
    let nameForm: UITextField = {
        let nameForm = UITextField()
        nameForm.placeholder = "Name"
        nameForm.translatesAutoresizingMaskIntoConstraints = false
        
        return nameForm
    }()
    
    let emailForm: UITextField = {
        let emailForm = UITextField()
        emailForm.placeholder = "Email"
        emailForm.keyboardType = .emailAddress
        emailForm.translatesAutoresizingMaskIntoConstraints = false
        
        return emailForm
    }()
    
    let passwordForm: UITextField = {
        let passwordForm = UITextField()
        passwordForm.placeholder = "Password"
        passwordForm.isSecureTextEntry = true
        passwordForm.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordForm
    }()
    
    let nameSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.rgb(red: 220, green: 220, blue: 220, alpha: 1)
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        return separator
    }()
    
    let emailSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.rgb(red: 220, green: 220, blue: 220, alpha: 1)
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        return separator
    }()
    
}
