//
//  TodoListPresenter.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import Foundation

class TaskListPresenter:NSObject, TaskListPresenterProtocol {
  

    private unowned let view : TaskListViewProtocol
    private let router : TaskListRouterProtocol
    private var interactor : TaskListInteractorProtocol
    
    init(interactor: TaskListInteractorProtocol,
         view : TaskListViewProtocol,
         router: TaskListRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        interactor.didSelectRow(at: indexPath)
        
    }
    
    func deleteRow(at indexPath: IndexPath) {
        interactor.deleteTask(at: indexPath)
    }
    
    func tabbedAddButton() {
        interactor.tabbedAddButton()
    }
    
    func sort() {
        interactor.sortTasks()
    }
    
    
}
extension TaskListPresenter: TaskListInteractorDelegate {
    func handleOutput(_ output: TaskListInteractorOutput) {
        switch output {
        case .showTaskList(let tasks):
            view.handleOutput(.showTaskList(tasks.map(TaskListPresentation.init)))
        case.showTaskDetail(let task):
            router.navigate(to: .showTaskDetail(task))
        case.showEmptyTaskDetail:
            router.navigate(to: .showEmptyTaskDetail)
        }
    }
    
    
}
