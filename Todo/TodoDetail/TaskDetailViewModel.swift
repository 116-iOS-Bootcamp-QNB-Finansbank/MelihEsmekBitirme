//
//  TaskDetailViewModel.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import Foundation

class TaskDetailViewModel: TaskDetailViewModelProtocol{
    
   weak var delegate: TaskDetailViewModelDelegate?
    private let task : Task
    
    init(task:Task){
        self.task = task
    }
    func viewDidLoad() {
        delegate?.showTaskDetail(task: TaskDetailPresentation(task: task))
    }

    
    
}
