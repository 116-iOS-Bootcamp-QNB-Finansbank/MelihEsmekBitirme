//
//  TaskListRouter.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import UIKit

class TaskListRouter:NSObject,TaskListRouterProtocol {
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    func navigate(to route: TaskListRoute) {
        switch route {
        case .showTaskDetail(let task):
            let viewController = TaskDetailBuilder.build(with: task)
            self.view.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
}
