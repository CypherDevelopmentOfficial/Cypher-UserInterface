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
        
        SwitchInstallment.addTarget(self, action: #selector(getter: SettingsViewController.switchState), for: UIControl.Event.valueChanged)
        
    }
    
    
}

@objc class SwitchInstallment: UISwitch {
    
    }
func switchIsChanged (SwitchInstallment: UISwitch)
    {
        if SwitchInstallment.isOn {
      //      switchState.text  = "UISwitch is ON"
      //      Don't bother, these were test lines. they didnt respond correctly.
      //      This should make certain that the installment shall be finished.
            _ = "true"
            // I also dont know how to make these modules really useful, so I hope my work wasnt futile, althoug it might be
            
}       else {
    //    switchState.accessibilityLabel (String)
    //    Don't bother. these are test lines. they didnt work
    //    If this is disabled like here, the device should only respring if the user ASKS for a respring, or exits the app.
            _ = "false"
            
        }
        
}


class SwitchCel: UISwitch {
    func stateChanged (switchState: SwitchCel)
    {
        if switchState.isOn {
          //    Add the function that should be here if its on. (that is prob nothing in this scenario)
            
            
        }
        else {
          //    Since this is the Cellular, this should disable downloads & installs if here
            
            
            
        }
    
}


}



// DOCUMENTATION OF GOALS
// The Goal is to get these switches to be responsive. They must be Connected to the Backend, and therefore must be stable beforehand already.
// To test this, There will be a neccesity for me to
// to make certain, i have disabled some things
// I am a JunkCoder, So dont bother
