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
        let viewModel = TaskDetailViewModel(task: task, service: appContainer.service)
        viewController.viewModel = viewModel
      
        return viewController
    }
    
    static func buildEmpty() -> TaskDetailViewController {
        let viewController = TaskDetailViewController()
        viewController.viewModel = TaskDetailViewModel(service: appContainer.service)
        return viewController
    }
}
