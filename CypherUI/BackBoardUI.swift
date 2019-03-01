//
//  BackBoardUI.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 12/11/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import Foundation
import SystemConfiguration


// This is the first part I will be seriously writing with certainty it is for the backend.
// This will most likely be used to check if repositories are online or offline.
// A replacement will be needed later, but i have to study apt before i can do this.
// If i learn how Apt works and can be implemented, I will use this to connect to a server. This method will be used to check if the repo is online. If Apt cant get any packages, it will be a "Under Maintanance" (yellow bulb), and if Error, Offline (red bulb), and if packages are being found, Online (Green bulb). Or dunno. whatever, it will be visible to the end user.

//// Since I am new, I will be documenting anything I hope to reach. One day I wont need to anymore.
////// When Niklas gives me the Missing Link (an apt replacement), this will be used instead.



/*

func checkWebsite(completion: @escaping (Bool) -> Void ) {
    guard let url = URL(string: source) else { return }
    
    var request = URLRequest(url: url)
    request.timeoutInterval = 1.0
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("\(error.localizedDescription)")
            completion(false)
        }
        if let httpResponse = response as? HTTPURLResponse {
            print("statusCode: \(httpResponse.statusCode)")
            // do your logic here
            // if statusCode == 200 ...
            completion(true)
            
        }
    }
    task.resume()
}
*/

//ugh

