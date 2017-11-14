//
//  CoursesInteractor.swift
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

protocol CoursesBusinessLogic {
    func fetchCourses(request: Courses.FetchCourses.Request)
}

protocol CoursesDataStore {
    var courses: [Course] { get set }
}

class CoursesInteractor: CoursesBusinessLogic, CoursesDataStore {
    var presenter: CoursesPresentationLogic?
    var worker: CoursesWorker?
    var courses: [Course] = []
  
    // MARK: - Fetch Courses
  
    func fetchCourses(request: Courses.FetchCourses.Request) {
        worker = CoursesWorker()
        worker?.fetchCourses(completion: { (courses, error) in
            if let theCources = courses {
                self.courses = theCources
                let response = Courses.FetchCourses.Response(courses: theCources, printableError: nil)
                self.presenter?.presentCourses(response: response)
            } else {
                let response = Courses.FetchCourses.Response(courses: [], printableError: error)
                self.presenter?.presentError(response: response)
            }
        })
    }
}
