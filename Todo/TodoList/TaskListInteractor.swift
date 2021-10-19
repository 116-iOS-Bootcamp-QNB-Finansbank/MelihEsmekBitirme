//
//  TodoListInteractor.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import Foundation

class TaskListInteractor: NSObject, TaskListInteractorProtocol {
    var sort: Bool = false
    func buildNotificationCenter() {
        let notificationCenter : NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.refreshData), name: .refreshData, object: nil)
    }
    
    @objc func refreshData(){
        self.getTasks()
    }

    var delegate: TaskListInteractorDelegate?
    private let service : CoreDataManagerProtocol
    private var tasks :[Task] = []
    init(service:CoreDataManagerProtocol) {
        self.service = service
    }
   
    func viewDidLoad() {
        self.buildNotificationCenter()
        getTasks()
    }
    
    func getTasks() {
        tasks = service.getTask(sort:sort)
        self.delegate?.handleOutput(.showTaskList(tasks))
    }
    func deleteTask(at indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        service.deleteTask(task: task)
    }
    
    func sortTasks() {
        if sort {
            sort = false
        }
        else {
            sort = true
        }
        tasks = service.getTask(sort:sort)
        self.delegate?.handleOutput(.showTaskList(tasks))
    }

    
    
//    func saveTask(task: Task) {
//        service.saveTask(task: task)
//    }
//    
//    func updateTask(task: Task) {
//        service.updateTask(task: task)
//    }
//    
//    func deleteTask(task: Task) {
//        service.deleteTask(task: task)
//    }
    func didSelectRow(at indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        self.delegate?.handleOutput(.showTaskDetail(task))
    }
    
    func tabbedAddButton() {
        self.delegate?.handleOutput(.showEmptyTaskDetail)
    }
    
}
