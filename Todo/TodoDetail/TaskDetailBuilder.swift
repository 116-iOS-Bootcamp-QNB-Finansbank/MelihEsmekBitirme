//
//  TaskDetailBuilder.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import Foundation

class TaskDetailBuilder {
    static func build(with task: Task) -> TaskDetailViewController {
        let viewController = TaskDetailViewController()
        viewController.viewModel = TaskDetailViewModel(task: task)
        return viewController
    }
}
