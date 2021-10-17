//
//  CoreDataManager.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 11.10.2021.
//

import UIKit
import CoreData


protocol CoreDataManagerProtocol {
    func saveTask(task:Task)
    func getTask() -> [Task]
    func updateTask(task:Task)
    func deleteTask(task:Task)
}

class CoreDataManager: CoreDataManagerProtocol {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items:[Task]?
    
        func saveTask(task:Task) {
                let newTask = Task(context: self.context)
                newTask.title = "textfield.text"
                newTask.detail = "use core data"
//                newTask.deadline = Date()
            do {
                try self.context.save()
            } catch  {
                
            }
        }

    func getTask() -> [Task] {
     
        do{
            let request = Task.fetchRequest() as NSFetchRequest<Task>
// MARK:            Filter
//
//            let pred = NSPredicate(format: "title CONTAINS %@","Date")
//            request.predicate = pred
//            let  sort = NSSortDescriptor(key: "deadline", ascending: true)
//            request.sortDescriptors = [sort]
            self.items = try context.fetch(request)
            
        }
        catch{
            
        }
        return items ?? []
    }
    
    func updateTask(task:Task) {
        
    }
    
 
    func deleteTask(task:Task){
        
    }
    
    
}
