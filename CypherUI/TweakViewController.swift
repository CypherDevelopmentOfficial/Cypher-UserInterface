//
//  TweakViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import UIKit

class TweakViewController: UIViewController {
   
    @IBOutlet weak var TweaksFeatureScrollView: UIScrollView!
    
    let featuretw1 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "FutureIsHere", "Logo": "MainLogo"]
    let featuretw2 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
    var featuretwArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        featureaArray = [featuretw1,featuretw2]
        TweaksFeatureScrollView.isPagingEnabled = true
        TweaksFeatureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featuretwArray.count), height:150)
        TweaksFeatureScrollView.showsHorizontalScrollIndicator = false
        TweaksFeatureScrollView.showsVerticalScrollIndicator = false
        //So i cant disable scrolling without breaking Paging... annoying
        loadTweakFeatured()
    }
    func loadTweakFeatured() {
        for (index, feature) in featuretwArray.enumerated() {
            guard let featureView = Bundle.main.loadNibNamed("Feature", owner: FeaturedBannerView(), options: nil)?.first as? FeaturedBannerView  else {
                NSLog("Error!")
                continue;
            }
            
            NSLog(feature["Logo"]!)
            
            
            TweaksFeatureScrollView.addSubview(featureView)
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


