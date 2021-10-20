//
//  TaskDetailPresentation.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import Foundation

struct TaskDetailPresentation {
    let title : String
    let detail : String
    let deadline : Date
    let uuid : UUID?
    
   
    
    init(title:String,detail:String, deadline: Date,uuid: UUID){
        self.title = title
        self.detail = detail
        self.deadline = deadline
        self.uuid = uuid
    }
//    
//    init(title:String,detail:String, deadline:Date){
//        self.title = title
//        self.detail = detail
//        self.deadline = deadline
//        
//    }
    
    init(task: Task) {
        self.init(title:task.title! ,
                  detail:task.detail ?? "",
                  deadline: task.deadline!,
                  uuid:task.uuid ?? UUID())
      
    }
}
