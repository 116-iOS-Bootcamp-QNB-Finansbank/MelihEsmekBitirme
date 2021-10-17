//
//  TaskDetailContracts.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import Foundation

protocol TaskDetailViewModelDelegate:NSObject {
    func showTaskDetail(task: TaskDetailPresentation)
   
}

protocol TaskDetailViewModelProtocol {
    var delegate : TaskDetailViewModelDelegate? {get set}
    func viewDidLoad()
}
