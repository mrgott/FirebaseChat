//
//  LoginViewController.swift
//  FirebaseChat
//
//  Created by Mikheil Gotiashvili on 10/6/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.rgb(red: 61, green: 91, blue: 151, alpha: 1)
        
        view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(formView)
        formViewHeightAnchor = formView.heightAnchor.constraint(equalToConstant: 150)
        formViewHeightAnchor?.isActive = true
        formView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        formView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        formView.addSubview(nameForm)
        formView.addSubview(emailForm)
        formView.addSubview(passwordForm)
        
        nameFieldHeightAnchor = nameForm.heightAnchor.constraint(equalToConstant: 50)
        nameFieldHeightAnchor?.isActive = true
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
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: formView.bottomAnchor, constant: 16).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(loginRegisterSegment)
        loginRegisterSegment.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -16).isActive = true
        loginRegisterSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegment.widthAnchor.constraint(equalTo: formView.widthAnchor).isActive = true
        loginRegisterSegment.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(logoImage)
        logoImage.bottomAnchor.constraint(equalTo: loginRegisterSegment.topAnchor, constant: -16).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

    var formViewHeightAnchor: NSLayoutConstraint?
    var nameFieldHeightAnchor: NSLayoutConstraint?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let backgroundImage: UIImageView = {
        let bgImage = UIImageView(image: UIImage(named: "login_bg"))
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        return bgImage
    }()
    
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
        emailForm.autocapitalizationType = .none
        
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.85)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        
        return button
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var loginRegisterSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Login", "Register"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.tintColor = .white
        segment.selectedSegmentIndex = 1
        segment.addTarget(self, action: #selector(handleLoginRegisterSegment), for: .valueChanged)
        
        return segment
    }()
    
    func handleLoginRegister(){
        
        if loginRegisterSegment.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
        
    }
    
    func handleLogin(){
        //Check if email and password have been set
        guard let email = emailForm.text, let password = passwordForm.text else { return }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error)
            }
            // Show ViewController
            self.dismiss(animated: true, completion: nil)
            
        })
    }
    
    func handleRegister() {
        //Check if email and password and name have been set
        guard let email = emailForm.text, let password = passwordForm.text, let name = nameForm.text else { return }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error)
                print("There has been an error while registering a user")
                return
            }
            
            guard let userId = user?.uid else { return }
            
            let rootRef = FIRDatabase.database().reference(fromURL: "https://fir-chat-b00c1.firebaseio.com/")
            let usersDBRef = rootRef.child("users").child(userId)
            let values = ["name": name, "email": email]
            usersDBRef.updateChildValues(values, withCompletionBlock: { (error, referrence) in
                
                if error != nil {
                    print(error)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
        })
        
    }
    
    func handleLoginRegisterSegment(){
        
        let title = loginRegisterSegment.titleForSegment(at: loginRegisterSegment.selectedSegmentIndex)
        registerButton.setTitle(title, for: .normal)
        
        formViewHeightAnchor?.constant = loginRegisterSegment.selectedSegmentIndex == 0 ? 100 : 150
        nameFieldHeightAnchor?.constant = loginRegisterSegment.selectedSegmentIndex == 0 ? 0 : 50
        nameForm.placeholder = loginRegisterSegment.selectedSegmentIndex == 0 ? "" : "Name"
        
    }
    
}
