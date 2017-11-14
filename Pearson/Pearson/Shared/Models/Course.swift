
//
//  Course.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct Course {
    var id: String
    var name: String
    var thumbnail: String
    var subject: String
    var grade: String
}

extension Course {
    static func parse(data: [String: Any]) -> Course {
        let id = data["id"] as! String
        let name = data["name"] as! String
        let thumbnail = data["thumbnail"] as! String
        let subject = data["subject"] as! String
        let grade = data["subject"] as! String
        return Course(id: id, name: name, thumbnail: thumbnail, subject: subject, grade: grade)
    }
}
