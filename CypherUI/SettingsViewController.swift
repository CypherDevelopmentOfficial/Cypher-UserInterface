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
import Photos





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
    
    func CheckAccountrankAtDiscordBot() {
        //This function is not ready yet, please be patient
        /// checkvalues. still have to see how we will do these things.
        //This will most likely link to a closed-source library so we can work on encryption. Or I will ask Niklas &/Or Kurtis to add something here.
        // if UserRank == nil {
        UserDefaults.standard.set("Regular User", forKey: "ranking")
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
        
        CheckAccountrankAtDiscordBot()
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
            if textField.text != "" {
                //Read TextFields text data
                print(textField.text!)
                NSLog("TF : \(textField.text!)")
                self.yourRepoArray.insert(textField.text!, at: 0)
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
       
        
        RepoTable.dataSource = yourRepoArray as? UITableViewDataSource
        
  
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
class AccDeets: UITableViewController {
    @IBOutlet var Welcomer: UILabel?
    @IBOutlet var Ranking: UILabel?
    @IBOutlet weak var userImage: UIImageView!
    @IBAction func changeImageView() {
        // This has hurt me way too much
        AddMaUserImage()
    }
    
    var UserName = UserDefaults.standard.string(forKey: "AccountToVerify")
 
    var UserRank = UserDefaults.standard.string(forKey: "ranking")
    
 let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Typically, here is a huge quantity of my JunkCode which shall require a rewrite one day.
        //  Oh, PS: Most Devs do not care anymore so I will never get new members in the team unless their NewBloods.
        Welcomer?.text = UserName
        Ranking?.text = UserRank
        self.userImage?.layer.cornerRadius = ((self.userImage?.frame.size.width)!) / 2;
        self.userImage?.clipsToBounds = true;
        self.userImage?.layer.borderWidth = 3.0
        
        
        // Yet again, some other things...
        
        checkPermission()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
    }
    
    
    // Using my "own" resources to rebuild this.
    func AddMaUserImage() {
        let alert = UIAlertController(title: "Choose how to add", message: "We are not ready YET", preferredStyle: UIAlertController.Style.actionSheet)
        //First action. Dunno if it will work, but whatevs.
        let photoLibraryImport = UIAlertAction(title: "Import from Photo Library", style: .default) { (alertAction) in self.present(self.imagePicker, animated: true, completion: nil)}
                    alert.addAction(photoLibraryImport)
        let userCameraForImage = UIAlertAction(title: "Use Camera instead is not made yet", style: .default) {
            (alertaction) in
        }
                    alert.addAction(userCameraForImage)
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
        
                    alert.addAction(cancelButton)
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : UIImage]) {
            
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] {
                self.userImage.contentMode = .scaleAspectFit
                self.userImage.image = pickedImage
                NSLog("It seems my code passes this point. I dont really know where the issue really comes from now")
            }
            else {
                NSLog("it seems my code sucks again and the image doesnt get set.")
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            print("cancel is clicked")
        }
        self.present(alert, animated:true, completion: nil)
        
}
    
    // This Code snippet was found on StackOverflow. Link supplied below. Some parts were copied from this command, just to give the user the good experience we want to give. Credit is given so we would not have to worry. There were no copyrights added to the comment at date of adding, so this actually already is generous. Date: April 1st, 2019.
    // Note to user: I dont care about April's Fools. If you think this is a joke, thats on you.
    /*
     https://stackoverflow.com/a/52459482
     */
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        @unknown default:
            print("What did just happen? it seems a unaccepted value jumped up.")
        }
    }
}
