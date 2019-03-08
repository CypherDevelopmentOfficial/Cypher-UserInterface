//
//  ThemesViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import UIKit

class ThemeViewController: UITableViewController {

    @IBOutlet weak var ThemesFeatureScrollView: UIScrollView!
    let feature1 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
    let feature2 = ["DeveloperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
    var featureArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        featureArray = [feature1,feature2]
        ThemesFeatureScrollView.isPagingEnabled = true
        ThemesFeatureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height:150)
        ThemesFeatureScrollView.showsHorizontalScrollIndicator = false
        ThemesFeatureScrollView.showsVerticalScrollIndicator = false
        //So i cant disable scrolling without breaking Paging... annoying
        loadThemeFeatured()
        
    }
    
     func loadThemeFeatured() {
        for (index, feature) in featureArray.enumerated() {
            // Just for the reminder of 2 hours of work to just fix this one tiny mistake. NEVER REMOVE THAT BREAKPOINT. (It sadly got removed. too bad...)
            guard let featureView = Bundle.main.loadNibNamed("Feature", owner: FeaturedBannerView(), options: nil)?.first as? FeaturedBannerView  else {
                NSLog("Error!")
                continue;
            }
            
            NSLog(feature["Logo"]!)
            

            ThemesFeatureScrollView.addSubview(featureView)
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
    
    @IBOutlet weak var TopShelfs: UIScrollView!
    /*
        let TpS1 = []
        let TpS2 = []
        let TpS3 = []
        let TpS4 = []
        let TpS5 = []
        let TpS6 = []
        let TpS7 = []
        let TpS8 = []
        let TpS9 = []
        let TpS10 = []
        let TpS11 = []
        let TpS12 = []
        let TpS13 = []
        let TpS14 = []
        let TpS15 = []
     
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TpS1Array = [TpS1,TpS2]
     
    func loadTopShelfs() {
                for (index, TpS) in TpSArray.enumerated() {
        // Just for the reminder of 2 hours of work to just fix this one tiny mistake. NEVER REMOVE THAT BREAKPOINT
             guard let TopShelfView = Bundle.main.loadNibNamed("ScrollViewWithConstantIcons", owner: FeaturedBannerView(), options: nil)?.first as? FeaturedBannerView  else {
             NSLog("Error!")
             continue;
     }
     
         TopShelfs.addSubview(featureView)
         TopShelfView.frame.size.width = self.view.bounds.size.width
         TopShelfView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
     
         TopShelfView.Logo.image = UIImage(named: feature["Logo"]!)
         TopShelfView.FeaturedBannerImage.image = UIImage(named: feature["FeaturedBannerImage"]!)
         TopShelfView.DeveloperName.text = feature["DeveloperName"]
         TopShelfView.RepoSource.text = feature["RepoSource"]
         TopShelfView.PriceName.text = feature["PriceName"]
         TopShelfView.FeaturedName.text = feature["FeaturedName"]
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

