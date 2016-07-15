//
//  ViewController.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/14/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",style: .Plain,target: self,action: #selector(handleLogout))
        
        
        
    }
    
    func handleLogout(){
        
        let loginController = LoginController()
        presentViewController(loginController, animated: true, completion: nil)
    }

  
}

