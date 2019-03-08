//
//  SettingsViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 07/03/2019.
//  Copyright © 2019 CyDev. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
// This is where the work shall be done for only this.

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
    override func viewDidLoad() {
        super.viewDidLoad()
            //Here Implementation should be added.
        
        SwitchCel.isOn = UserDefaults.standard.bool(forKey: "SwitchCel")
        SwitchInstallment.isOn = UserDefaults.standard.bool(forKey: "SwitchInstallment")
        
        
        func CheckForUserInteraction() {
            
        }
       
        //SwitchCel.addTarget(self, action: Selector(("stateChanged")), for: UIControl.Event.valueChanged)
        
            //UserDefaults.standard.set(true, forKey: "SwitchCel")
                
            
        
        //UserDefaults.standard.set(true, forKey: "SwitchInstallment")
    }


}

