//
//  LoginPage.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//


import Foundation
import UIKit
import Accounts


class LoginPage: UIViewController{
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let backButton = UIBarButtonItem(title: " ", style:UIBarButtonItem.Style.plain, target: navigationController, action: nil)
    navigationItem.leftBarButtonItem = backButton
    
    }
    
    //// The next part should be configured by our BackEnd Dev to work. Shoutout @Niklas!
    
    // let URL_USER_LOGIN = " (whatever you want as servicehost.) "
    
    //// This is to store Vaulues
    let defaultVaulues = UserDefaults.standard
    
    //// This is actually some UI Stuff that should work.
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        let parameters: Parameters=[
            "username":textFieldUserName.text!,
            "password":textFieldPassword.text!
        ]
    }
    
    
}
class ProfileViewController: UIViewController {
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    
    
    
    
    
    
    
}
