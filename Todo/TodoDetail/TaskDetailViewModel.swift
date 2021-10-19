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
    
    init(task:Task,service: CoreDataManagerProtocol){
        self.task = task
        self.service = service
    }
   
    init(service: CoreDataManagerProtocol){
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
            }
        
    }
    
    func delete() {
        if(task != nil){
            service.deleteTask(task: task!)

        }else{
            return
        }
          
        
        
    }
    
}
