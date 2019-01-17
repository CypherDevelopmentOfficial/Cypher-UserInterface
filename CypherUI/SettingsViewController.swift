//
//  SettingsViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import UIKit
import SystemConfiguration
import Foundation

class SettingsViewController: UIViewController {
    @IBOutlet var SwitchCel: UISwitch!
    @IBOutlet var SwitchInstallment: UISwitch!
    @IBOutlet var switchState: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    SwitchInstallment.addTarget(self, action: #selector(getter: SettingsViewController.switchState), for: UIControl.Event.valueChanged)
        
    }
    
    
}

class SwitchInstallment: UISwitch {
    
  //  @IBAction func RefactorInstall(_ sender: SwitchInstallment) {
        
       
            
        }
   // }
    
    
    
    



class SwitchCel: UISwitch {
    
   // @IBAction func RefactorCellular(_ sender: SwitchCel) {
        
    }
    
//}




// DOCUMENTATION OF GOALS
// The Goal is to get these switches to be responsive. They must be Connected to the Backend, and therefore must be stable beforehand already.
// To test this, There will be a neccesity for me to
// to make certain, i have disabled some things
// I am a JunkCoder, So dont bother
