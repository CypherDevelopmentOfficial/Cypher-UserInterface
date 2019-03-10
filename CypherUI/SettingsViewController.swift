//
//  SettingsViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 07/03/2019.
//  Copyright © 2019 CyDev. All rights reserved.
//
//
//  It seems to be that i cannot let the text of the Login Change if a value is changed. I will work on this soon.


import Foundation
import UIKit

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
        
         if UserDefaults.standard.bool(forKey: "LoggedInUser") == false {
            LoginRAccountViewer?.text  = "Login"
        }
        if UserDefaults.standard.bool(forKey: "LoggedInUser") == true {
            LoginRAccountViewer?.text = "View Profile"
        }
        
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
    }
    @IBOutlet weak var RepoTable: UITableView!
    
    override func viewDidLoad() {
        ManRepoSwitch.isOn = UserDefaults.standard.bool(forKey: "modeManual")
        if UserDefaults.standard.bool(forKey: "modeManual") == false {
            RepoTable.isHidden = true
        }
        if UserDefaults.standard.bool(forKey: "modeManual") == true {
            RepoTable.isHidden = false
        }
        
        
    
        }
        
        
    
}
