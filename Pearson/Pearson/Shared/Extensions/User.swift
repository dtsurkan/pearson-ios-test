//
//  User.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var thumbnail: String
}

extension User {
    static func parse(data: [String: Any]) -> User {
        let id = data["id"] as! String
        let fName = data["fName"] as! String
        let lName = data["lName"] as! String
        let username = data["username"] as! String
        let email = data["email"] as! String
        let thumbnail = data["thumbnail"] as! String
        
        return User(id: id, firstName: fName, lastName: lName, username: username, email: email, thumbnail: thumbnail)
    }
}
