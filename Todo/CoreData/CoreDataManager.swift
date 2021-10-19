//
//  CoreDataManager.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 11.10.2021.
//

import UIKit
import CoreData


protocol CoreDataManagerProtocol {
    func saveTask(TaskPresentation:TaskDetailPresentation)
    func getTask(sort:Bool) -> [Task]
    func updateTask(TaskPresentation:TaskDetailPresentation, task: Task)
    func deleteTask(task:Task)
}

class CoreDataManager: CoreDataManagerProtocol {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items:[Task]?
    
    func saveContext(){
        if context.hasChanges {
            do {
                try self.context.save()
                NotificationCenter.default.post(name: .refreshData, object: nil)
            } catch  {
                
            }
        }

    }
    
        func saveTask(TaskPresentation:TaskDetailPresentation) {
            let newTask = Task(context: self.context)
            newTask.title = TaskPresentation.title
            newTask.detail = TaskPresentation.detail
            newTask.deadline = TaskPresentation.deadline
            self.saveContext()
               
           
        }

    func getTask(sort:Bool) -> [Task] {
        let request = Task.fetchRequest() as NSFetchRequest<Task>
        if sort {
            let  sort = NSSortDescriptor(key: "deadline", ascending: false)
            request.sortDescriptors = [sort]
        }
        do{
            self.items = try context.fetch(request)
            
        }
        catch{
            
        }
        return items ?? []
    }
    
    func updateTask(TaskPresentation:TaskDetailPresentation, task: Task) {
        task.title = TaskPresentation.title
        task.detail = TaskPresentation.detail
        task.deadline = TaskPresentation.deadline
        saveContext()

    }
    
 
    func deleteTask(task:Task){
        
            context.delete(task)
        self.saveContext()
    
      
    }
    
    
}
