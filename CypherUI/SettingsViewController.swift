//
//  ViewController.swift
//  NSUserDefaultsExample
//
//  Created by Peter Witham on 9/11/16.
//  Copyright © 2016 Peter Witham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let switchKeyConstant = "switchKeyName"
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

