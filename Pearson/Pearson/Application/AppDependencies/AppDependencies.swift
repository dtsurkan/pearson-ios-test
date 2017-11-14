//
//  AppDependencies.swift
//  Pearson
//
//  Created by Dima Tsurkan on 09.11.2017.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    func setupDependenciesForApplication(_ app: UIApplication, launchOptions: [AnyHashable: Any]?) {
        addNotifications()
    }
    
    // MARK: - Internal
    
    private func addNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(signOutNotificationHandler),
                                               name: NotificationKeys.signOutNotificationKey,
                                               object: nil)
    }
    
    @objc private func signOutNotificationHandler() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: XAppToken.DefaultsKeys.TokenKey.rawValue)
        let controller = UIStoryboard.auth().viewController(withID: .loginViewController) as! LoginViewController
        let navController = UINavigationController(rootViewController: controller)
        appDelegate().switchTo(auth: navController)
    }
}
