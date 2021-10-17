//
//  TodoListContracts.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import Foundation

// Interactor


//MARK: View
protocol TaskListViewProtocol: NSObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}

//MARK: Interactor
enum TaskListInteractorOutput {
    case showTaskDetail(Task)
    case showTaskList([Task])
}

protocol TaskListInteractorDelegate: NSObject {
    func handleOutput(_ output: TaskListInteractorOutput)
}

protocol TaskListInteractorProtocol: NSObject {
    var delegate: TaskListInteractorDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func getTasks()
    func saveTask(task:Task)
    func updateTask(task:Task)
    func deleteTask(task: Task)
}

//MARK: Presenter
// input
protocol TaskListPresenterProtocol: NSObject {
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func tabbedAdded()
}

enum TaskListPresenterOutput {
    case showTaskList([TaskListPresentation])
}

//MARK: Router
enum TaskListRoute {
    case showTaskDetail(Task)
}

protocol TaskListRouterProtocol: NSObject {
    func navigate(to route: TaskListRoute)
    
}

