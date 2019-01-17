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
    let feature1 = ["DevelperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerLaunch"]
    let feature2 = ["DevelperName":"CypherDevelopment", "RepoSource": "YourDevice", "PriceName": "FREE", "FeaturedName": "Cypher", "FeaturedBannerImage": "BannerLaunch"]
    var featureArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        featureArray = [feature1,feature2]
        ThemesFeatureScrollView.isPagingEnabled = true
        ThemesFeatureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height:150)
        ThemesFeatureScrollView.showsHorizontalScrollIndicator = false
        
     //   loadThemeFeatured()
    }
    
    
    //func loadThemeFeatured() {
   //     for (index, featured) in featureArray.enumerated() {
    //        let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeaturedView {}
    //    }
    //}
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
