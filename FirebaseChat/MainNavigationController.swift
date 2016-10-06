//
//  MainNavigationController.swift
//  FirebaseChat
//
//  Created by Mikheil Gotiashvili on 10/6/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let viewControllersList = [ViewController()]
        //setViewControllers(viewControllersList, animated: true)
        viewControllers = viewControllersList
        view.backgroundColor = .white
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
