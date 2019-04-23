//
//  Legacy.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 21/04/2019.
//  Copyright © 2019 CypherDev. All rights reserved.
//

import Foundation
import UIKit

class LegacyHome: UIViewController {
    // Home page. will be worked on later
}
class LegacyRepoViewAndSearch: UITableViewController {
    // RepoView and search. many things to be added
    @IBAction func AddButton(_ sender: Any) {
        func AddMaRepo() {
            //Step : 1
            let alert = UIAlertController(title: "Add Repository", message: "We are not ready YET", preferredStyle: UIAlertController.Style.alert)
            //Step : 2
            let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
                let textField = alert.textFields![0] as UITextField
                if textField.text != "" {
                    //Read TextFields text data
                    print(textField.text!)
                    NSLog("TF : \(textField.text!)")
                    let newRepo: String = textField.text!
                    // Now we need an array that should be saved to UserDefault. Will find out how.
                    yourRepoArray = UserDefaults.standard.stringArray(forKey: "SavedRepoArray")!
                    yourRepoArray.append(newRepo)
                    NSLog ("the complete list is now: \(yourRepoArray)")
                    UserDefaults.standard.set(yourRepoArray, forKey: "SavedRepoArray")
                    // If im correct this should save the Array permanently.
                    
                    NSLog ("getting info from \(String(describing: UserDefaults.standard.stringArray(forKey: "SavedRepoArray")))")
                } else {
                    print("TF is Empty...")
                }
                
                
            }
            
            //Step : adding textfield
            
            alert.addTextField { (textField) in
                textField.placeholder = "Enter Repo URL"
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
AddMaRepo()
    }
    
}
class LegacyInstalledAndChanges: UITableViewController {
    // Installed and changes to recent packages.
}

class CategoriesinRepos: UITableViewController {
    // all the categories.
}

class ItemsWithinCategories: UITableViewController {
    // all the content of a category
}




public var yourRepoArray = [String]()
