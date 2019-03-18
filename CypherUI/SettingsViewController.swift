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


// This is just to choose which Segue shall be used. This is because I am inable to write my own Custom Segue. Or I am just too Lazy to search for it. First I need everything to work; Afterwards I will worry about the rest.
//
//  Once again, Still written by John NemECis
//
//
class SubDiversionView: UIViewController {
    @IBOutlet weak var logMeOut: UIButton!
    @IBAction func logOffPressed(_ sender: UIButton) {
        if UserDefaults.standard.bool(forKey: "LoggedInUser") != false {
            UserDefaults.standard.set(false, forKey: "LoggedInUser")
        }
        else { NSLog("why u tryna crash me?")}
    }
    
    
    
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
    var yourRepoArray = [String]()
    
    @IBOutlet weak var ManRepoSwitch: UISwitch!
    @IBAction func flipManual(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "modeManual")
        reloadInputViews()
    }
    @IBOutlet weak var RepoTable: UITableView!
    
    
    
    // Here the function will be written to add repositories at a later date.
    func AddMaRepo() {
        //Step : 1
        let alert = UIAlertController(title: "Add Repository", message: "We are not ready YET", preferredStyle: UIAlertController.Style.alert)
        //Step : 2
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            let textField2 = alert.textFields![1] as UITextField
            if textField.text != "" {
                //Read TextFields text data
                print(textField.text!)
                print("TF 1 : \(textField.text!)")
                
            } else {
                print("TF 1 is Empty...")
            }
            
            if textField2.text != "" {
                print(textField2.text!)
                print("TF 2 : \(textField2.text!)")
            } else {
                print("TF 2 is Empty...")
            }
        }
        
        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your first name"
            
        }
        //For second TF
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your last name"
            
        }
        
        //Step : 4
        alert.addAction(save)
        //Cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        //OR single line action
        //alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })
        
        self.present(alert, animated:true, completion: nil)
        
    }

    @IBOutlet weak var addButton: UIBarButtonItem!
    
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
        UserDefaults.standard.set(textFieldUserName.text, forKey: "AccountToVerify")
        if UserDefaults.standard.string(forKey: "AccountToVerify") == "" {
           // print("You didnt do anything. There is no account name here")
            NSLog("Either something went wrong, OR you just chose to keep this empty. Probably Option 1 huh?")
            UserDefaults.standard.set(false, forKey:"LoggedInUser")
        }
        if UserDefaults.standard.string(forKey: "AccountToVerify") != "" {
            //print("Verifying will be done, please wait. Password is just to fill space atm. Without in-app backend, we will ensure it works in other ways.")
            NSLog("This means it breaks past this point. what shall it be?")
            UserDefaults.standard.set(true, forKey:"LoggedInUser")
            ////self.performSegue(withIdentifier: "gotoAccDetails2", sender: self)
        }
    }
    
}
/*
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
///////////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
////////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
/////////////////////%%%%%%%//////////////////////////////////////////////////////////////////////////////////////////
//////////////////%%%%%%%%////+++++/////===========================____________///////////////////////////////////////
//////////////////%%%%%%%%//+/////+///////////////////////////////////////////////////////////////////////////////////
/////////////////%%%%%%%//+///////+///////////////////////////////////////////////////////////////////////////////////
////////////////%%%%%%%%//+///////+///////////////////////////////////////////////////////////////////////////////////
////////////////%%%%%%%%//+///////+///////////////////////////////////////////////////////////////////////////////////
//////////////////%%%%%%%%//+/////+///////////////////////////////////////////////////////////////////////////////////
///////////////////%%%%%%%%%//+++++///////////////////////////////////////////////////////////////////////////////////
////////////////////%%%%%%%%%/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
////////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
////////////////////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 */
class AccDeets: UIViewController {
    @IBOutlet var Welcomer: UILabel?
    var WelcomeVar = "welcome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Typically, here is a huge quantity of my JunkCode which shall require a rewrite one day.
        //  Oh, PS: Most Devs do not care anymore so I will never get new members in the team unless their NewBloods.
        Welcomer?.text = WelcomeVar
    }
}


        
    




