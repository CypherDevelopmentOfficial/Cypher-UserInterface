////
////  LoginPage.swift
////  CypherUI
////
////  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
////  Copyright © 2018 CyDev. All rights reserved.
////
//// Just noticed the whole part here is garbage. I will be fixing this at a later date. this cant be used else User Accounts could leak.

import Foundation
import UIKit
import Accounts
import Alamofire


class LoginPage: UIViewController{
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let backButton = UIBarButtonItem(title: "Back", style:UIBarButtonItem.Style.plain, target: navigationController, action: nil)
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
        //let parameters: Parameters=[
        //    "username":textFieldUserName.text!,
        //    "password":textFieldPassword.text!
        //]
    }
    
    
}
class ProfileViewController: UIViewController {
    
    ////This is just a label to get to see your system knows you.
    @IBOutlet weak var labelUserName: UILabel!
    
    //// This is the button. Dont mess with it unless you know what it does. <0/
    @IBAction func buttonLogout(_ sender: UIButton) {
        //// removing values from the Default List
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //// the switch to the Login Screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginPage") as! LoginPage
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// Seemed neccesary to note that I havent checked it too far since I wont be setting up the backend.
        //// Sincerely John NemECis
        let backButton = UIBarButtonItem(title: "", style:UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //// This is required to keep the data alive
        let defaultValues = UserDefaults.standard
        if let name = defaultValues.string(forKey: "username"){
            //// setting the name to the label
            labelUserName.text = name
        } else {
            ////send back to loginpage
        }
        
    }

    
    
    
    
    
    
    
    
}
