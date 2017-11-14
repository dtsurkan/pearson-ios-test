//
//  CoursesPresenter.swift
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

protocol CoursesPresentationLogic {
    func presentCourses(response: Courses.FetchCourses.Response)
    func presentError(response: Courses.FetchCourses.Response)
}

class CoursesPresenter: CoursesPresentationLogic {
    weak var viewController: CoursesDisplayLogic?
  
    // MARK: - Present Courses
  
    func presentCourses(response: Courses.FetchCourses.Response) {
        let textBooks = Course(id: "99991",
                               name: "All Courses",
                               thumbnail: "https://s3.amazonaws.com/pulse-lms/content/default_textbooks.jpg",
                               subject: "Textbooks", grade: "", moodleDiscussionForumId: "")
        var courses = response.courses
        courses.append(textBooks)
        let viewModel = Courses.FetchCourses.ViewModel(courses: courses, printableError: response.printableError)
        viewController?.displayCourses(viewModel: viewModel)
    }
    
    func presentError(response: Courses.FetchCourses.Response) {
        let viewModel = Courses.FetchCourses.ViewModel(courses: response.courses, printableError: response.printableError)
        viewController?.displayError(viewModel: viewModel)
    }
}
