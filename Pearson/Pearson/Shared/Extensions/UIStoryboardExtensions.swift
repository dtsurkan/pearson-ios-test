//
//  UIStoryboardExtensions.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit

enum StoryboardNames: String {
    case auth = "Auth"
    case main = "Main"
}

enum ViewControllerStoryboardIdentifier: String {
    case tabBarController = "MainTabBarViewController"
    case loginViewController = "LoginViewController"
    case authViewController = "AuthViewController"
    case coursesViewController = "CoursesViewController"
    case accountViewController = "AccountViewController"
}

extension UIStoryboard {
    
    class func auth() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.auth.rawValue, bundle: nil)
    }
    
    class func main() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.main.rawValue, bundle: nil)
    }
    
    func viewController(withID identifier: ViewControllerStoryboardIdentifier) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
