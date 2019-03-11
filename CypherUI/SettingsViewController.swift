//
//  SettingsViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 07/03/2019.
//  Copyright © 2019 CyDev. All rights reserved.
//
//
//  It seems to be that i cannot let the text of the Login Change if a value is changed. I will work on this soon.

import KeychainAccess
import Alamofire
import Foundation
import UIKit
import Accounts


class SettingsViewController: UITableViewController {
// This is where the work shall be done for only this.
    @IBOutlet weak var LoginRAccountViewer: UILabel?
    
    @IBOutlet weak var TempSwitch: UISwitch!
    @IBOutlet weak var SwitchCel: UISwitch!
    @IBOutlet weak var SwitchInstallment: UISwitch!
    @IBAction func changeSwitchCel(_ sender: UISwitch) {
        //This is all merely in teststage. P.S. This will probably have easier ways, but I rather finish up faster than learning how to implement it faster.
        
        UserDefaults.standard.set(sender.isOn, forKey: "SwitchCel");
        NSLog ("You clicked here! SwitchCel." )
    }
    @IBAction func changeSwitchInstallment(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "SwitchInstallment");
        NSLog("You clicked here! SwitchInstallment.")
    }
    @IBAction func TestChange(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "LoggedInUser")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //Here Implementation should be added.
        
        SwitchCel.isOn = UserDefaults.standard.bool(forKey: "SwitchCel")
        SwitchInstallment.isOn = UserDefaults.standard.bool(forKey: "SwitchInstallment")
        TempSwitch.isOn = UserDefaults.standard.bool(forKey: "LoggedInUser")
        TempSwitch.isHidden = true
         if UserDefaults.standard.bool(forKey: "LoggedInUser") == false {
            LoginRAccountViewer?.text  = "Login"
            // I shall add a reference to push to LoginScreen here.
            
        }
         if UserDefaults.standard.bool(forKey: "LoggedInUser") == true {
            LoginRAccountViewer?.text = "View Profile"
            // I shall add a reference to push to ProfileViewer here.
            
        }
        
    }

    
    
}


//
//
//
//
//
class SubDiversionView: UIViewController {
    func MOVENOW() {
        if UserDefaults.standard.bool(forKey: "LoggedInUser") == false {
            self.performSegue(withIdentifier: "gotoLogin", sender: nil)
            NSLog("Now it shall show the Login Page in a future Build. it sends there standard now.")
            
        }
        if UserDefaults.standard.bool(forKey: "LoggedInUser") == true {
            self.performSegue(withIdentifier: "gotoAccDetails", sender: nil)
            NSLog("Now it shall show Account Details in a future build. It sends you to login without modification because I have not implemented the account parts yet.")
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("I hate the fact it takes me this long to write ANYTHING")
        MOVENOW()
    }
    
}



//  Location of the Manual Repository DB.
//  Eventually, we will work on giving this more work. Right now, UI first.
//
//
//
//
//

class ManRepoSelector: UIViewController {
    @IBOutlet weak var ManRepoSwitch: UISwitch!
    @IBAction func flipManual(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "modeManual")
        reloadInputViews()
    }
    @IBOutlet weak var RepoTable: UITableView!
    // Here the function will be written to add repositories at a later date.
    func AddMaRepo(){
        NSLog("We are not ready for this last action YET")
    }
    
    
    @IBAction func addClicked(_ sender: Any) {
        AddMaRepo()
    }
    @IBAction func Done(_ sender: Any) {
        NSLog("Will send to HomeScreen because every piece of data shall be reloaded at the end, and I dont know how to fix it in another, more elegant way.")
    }
    
    
    
    
    
    override func viewDidLoad() {
       // Here we see the ManualRepositorySwitch taking effect.
        ManRepoSwitch.isOn = UserDefaults.standard.bool(forKey: "modeManual")
        if UserDefaults.standard.bool(forKey: "modeManual") == false {
            RepoTable.isHidden = true
        }
        if UserDefaults.standard.bool(forKey: "modeManual") == true {
            RepoTable.isHidden = false
        }
        // Here we will eventually see all further things.
        

        
    
        }
  
        
    
}

//
//
//
//
//
//
//

class LoginPage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBAction func buttonLogin(_ sender: UIButton) {
        //// let UrAccChain = Keychain(service: "com.CypherDev.CypherUI")
    }
    
}
class ProfileViewController: UIViewController {
    
    // This is just a label to get to see your system knows you.
    @IBOutlet weak var labelUserName: UILabel!
    
    // This is the button. Dont mess with it unless you know what it does. <0/
    @IBAction func buttonLogout(_ sender: UIButton) {
    // removing values from the Default List
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        // the switch to the Login Screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginPage") as! LoginPage
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
}


        
    



