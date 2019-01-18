//
//  ThemesViewController.swift
//  CypherUI
//
//  Created by Team CypherDevelopment Remote Desktop on 18/09/2018.
//  Copyright © 2018 CyDev. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {

    @IBOutlet weak var ThemesFeatureScrollView: UIScrollView!
    let feature1 = ["DevelperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
    let feature2 = ["DevelperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerAtLaunch", "Logo": "MainLogo"]
    var featureArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        featureArray = [feature1,feature2]
        ThemesFeatureScrollView.isPagingEnabled = true
        ThemesFeatureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height:150)
        ThemesFeatureScrollView.showsHorizontalScrollIndicator = false
        
          loadThemeFeatured()
    
    }
    
     func loadThemeFeatured() {
        for (index, feature) in featureArray.enumerated() {
            if let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? featureView {
                featureView.Logo.image = UIImage(named: feature["Logo"]!)
                featureView.FeaturedBannerImage.image = UIImage(named: feature["FeaturedBannerImage"]!)
                featureView.DeveloperName.text = feature["DevelperName"]
                featureView.RepoSource.text = feature["RepoSource"]
                featureView.PriceName.text = feature["PriceName"]
                featureView.FeaturedName.text = feature["FeaturedName"]
                
                ThemesFeatureScrollView.addSubview(featureView)
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
