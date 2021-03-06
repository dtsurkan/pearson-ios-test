//
//  AuthRouter.swift
//  Pearson
//
//  Created by Dima Tsurkan on 09.11.2017.
//  Copyright (c) 2017 Dima Tsurkan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol AuthRoutingLogic {
    func routeToCources()
}

protocol AuthDataPassing {
    var dataStore: AuthDataStore? { get set }
}

class AuthRouter: NSObject, AuthRoutingLogic, AuthDataPassing {
    weak var viewController: AuthViewController?
    var dataStore: AuthDataStore?
  
    // MARK: Routing
  
    func routeToCources() {
        let destinationVC = UIStoryboard.main().viewController(withID: .tabBarController) as! MainTabBarViewController
        navigateToCources(source: viewController!, destination: destinationVC)
    }

    // MARK: Navigation
  
    func navigateToCources(source: AuthViewController, destination: MainTabBarViewController) {
        appDelegate().switchRootViewController(to: destination)
    }
  
  
    
}
