//
//  CourseTableViewCell.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit
import SDWebImage

class CourseTableViewCell: UITableViewCell {
    static var nibName = "CourseTableViewCell"
    static var identifier = "CourseTableViewCell"
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var shadowContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
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
    
    func fillIn(course: Course) {
        titleLabel.text = "\(course.moodleDiscussionForumId) \(course.name)"
        if course.name.contains("All") {
            subTitleLabel.text = "\(course.subject)"
        } else {
            subTitleLabel.text = "\(course.subject) Grade \(course.grade)"
        }
        
        guard let url = URL(string: course.thumbnail) else {
            return
        }
        
        thumbnailImageView.sd_setShowActivityIndicatorView(true)
        thumbnailImageView.sd_setIndicatorStyle(.gray)
        thumbnailImageView.sd_setImage(with: url, completed: nil)
    }
}
