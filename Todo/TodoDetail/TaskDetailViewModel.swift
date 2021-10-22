//
//  TaskDetailViewModel.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import Foundation

class TaskDetailViewModel: TaskDetailViewModelProtocol{
   
     private let service : CoreDataManagerProtocol
   weak var delegate: TaskDetailViewModelDelegate?
    private var task : Task?
    private let notification : NotificationManagerProtocol
    
    init(task:Task,service: CoreDataManagerProtocol,notification: NotificationManagerProtocol){
        self.task = task
        self.service = service
        self.notification = notification
    }
   
    init(service: CoreDataManagerProtocol,notification: NotificationManagerProtocol){
        self.notification = notification
        self.service = service
    }
    func viewDidLoad() {
        if (task != nil){
            delegate?.showTaskDetail(task: TaskDetailPresentation(task: task!))
        }
    }
    

    func saveTask(TaskPresentation : TaskDetailPresentation) {
        if(task != nil) {
            self.service.updateTask(TaskPresentation: TaskPresentation, task: task!)
            
        } else{
            service.saveTask(TaskPresentation: TaskPresentation)
            notification.createNotification(task: TaskPresentation)
            }
        
    }
    
    func delete() {
        if(task != nil){
            service.deleteTask(task: task!)
            notification.cancelNotification(task: task!)

        }else{
            return
        }
    }
}
