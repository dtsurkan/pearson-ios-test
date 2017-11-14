//
//  AppHelper.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import UIKit

enum NotificationKeys {
    static let signOutNotificationKey = Notification.Name(rawValue: "SignOutNotificationKey")
}

func appDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}
