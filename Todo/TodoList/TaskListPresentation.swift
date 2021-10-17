//
//  TodoListPresentation.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import Foundation

struct TaskListPresentation {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    init(task: Task) {
        self.init(title: task.title ?? "")
    }
}
