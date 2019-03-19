//
//  AppViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import UIKit


class AppViewController: UITableViewController {
    @IBOutlet weak var AppsFeatureScrollView: UIScrollView!
    
     let featurea1 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "FutureIsHere", "Logo": "MainLogo"]
     let featurea2 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
     var featureaArray = [Dictionary<String,String>]()
     
     override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view, typically from a nib.
     featureaArray = [featurea1,featurea2]
     AppsFeatureScrollView.isPagingEnabled = true
     AppsFeatureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureaArray.count), height:150)
     AppsFeatureScrollView.showsHorizontalScrollIndicator = false
     AppsFeatureScrollView.showsVerticalScrollIndicator = false
     //So i cant disable scrolling without breaking Paging... annoying
     loadAppFeatured()
     }
    func loadAppFeatured() {
        for (index, feature) in featureaArray.enumerated() {
            guard let featureView = Bundle.main.loadNibNamed("Feature", owner: FeaturedBannerView(), options: nil)?.first as? FeaturedBannerView  else {
                NSLog("Error!")
                continue;
            }
            
            NSLog(feature["Logo"]!)
            
            
            AppsFeatureScrollView.addSubview(featureView)
            featureView.frame.size.width = self.view.bounds.size.width
            featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            
            featureView.Logo.image = UIImage(named: feature["Logo"]!)
            featureView.FeaturedBannerImage.image = UIImage(named: feature["FeaturedBannerImage"]!)
            featureView.DeveloperName.text = feature["DeveloperName"]
            featureView.RepoSource.text = feature["RepoSource"]
            featureView.PriceName.text = feature["PriceName"]
            featureView.FeaturedName.text = feature["FeaturedName"]
            
            
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
