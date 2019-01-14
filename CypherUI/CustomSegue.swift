//
//  CustomSegue.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 19/11/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import Foundation
import UIKit

class firstCustomSegue: UIStoryboardSegue {
    override func perform() {
        // Declare the INITAL view and the DESTINATION view
        // This will break and be nil if you don't have a second view controller for your DESTINATION view
        let initalView = self.source.view as UIView
        let destinationView = self.destination.view as UIView
        
        // Specify the screen HEIGHT and WIDTH
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        
        // Specify the INITIAL PLACEMENT of the DESTINATION view
        initalView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        destinationView.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        // Access the app's key window and add the DESTINATION view ABOVE the INITAL view
        let appWindow = UIApplication.shared.keyWindow
        appWindow?.insertSubview(destinationView, aboveSubview: initalView)
        
        // Animate the segue's transition
        UIView.animate(withDuration: 0.4, animations: {
            // Left/Right
            initalView.frame = (initalView.frame.offsetBy(dx: -screenWidth, dy: 0))
            destinationView.frame = (destinationView.frame.offsetBy(dx: -screenWidth, dy: 0))
        }) { (Bool) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
    }
}
