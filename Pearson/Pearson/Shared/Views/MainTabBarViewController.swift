//
//  MainTabBarViewController.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 3
        
        tabBar.tintColor = UIColor(red: 54/255, green: 126/255, blue: 159/255, alpha: 1.0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}
