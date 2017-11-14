//
//  CourseTableViewCell.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    static var nibName = "CourseTableViewCell"
    static var identifier = "CourseTableViewCell"
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var shadowContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.borderWidth = 0.5
        container.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        container.layer.cornerRadius = 3
        
        shadowContainer.layer.shadowColor = UIColor.gray.cgColor
        shadowContainer.layer.shadowOpacity = 1
        shadowContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowContainer.layer.shadowRadius = 3
        shadowContainer.layer.shouldRasterize = true
    }
}
