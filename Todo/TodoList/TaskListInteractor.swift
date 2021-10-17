//
//  TodoListInteractor.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import Foundation

class TaskListInteractor: NSObject, TaskListInteractorProtocol {
   
    
   
    var delegate: TaskListInteractorDelegate?
    private let service : CoreDataManagerProtocol
    private var tasks :[Task] = []
    init(service:CoreDataManagerProtocol) {
        self.service = service
    }
   
    func viewDidLoad() {
        getTasks()
    }
    
    func getTasks() {
        tasks = service.getTask()
        self.delegate?.handleOutput(.showTaskList(tasks))
    }
    
    func saveTask(task: Task) {
        service.saveTask(task: task)
    }
    
    func updateTask(task: Task) {
        service.updateTask(task: task)
    }
    
    func deleteTask(task: Task) {
        service.deleteTask(task: task)
    }
    func didSelectRow(at indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        self.delegate?.handleOutput(.showTaskDetail(task))
    }
    
}
