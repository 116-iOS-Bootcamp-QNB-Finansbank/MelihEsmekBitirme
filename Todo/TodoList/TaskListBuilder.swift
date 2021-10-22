//
//  TodoListBuilder.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import UIKit

class TaskListBuilder {
    static func build() -> TaskListViewController {
        let storyboard = UIStoryboard(name: "TodoList", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "TaskListViewController") as! TaskListViewController

        let interactor = TaskListInteractor(service: appContainer.service)
        let router = TaskListRouter(view: view)
        let presenter = TaskListPresenter(interactor: interactor, view: view, router: router)
        view.presenter = presenter
        interactor.delegate = presenter
        return view
    }


}
