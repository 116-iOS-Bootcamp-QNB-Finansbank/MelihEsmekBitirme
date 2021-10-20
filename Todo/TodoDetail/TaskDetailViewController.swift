//
//  TaskDetailViewController.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import UIKit

class TaskDetailViewController: UIViewController {
   

    @IBOutlet weak var taskTitleField: UITextField!

    @IBOutlet weak var taskDetail: UITextField!
    
    @IBOutlet weak var taskDeadline: UIDatePicker!
    
//     let task : Task?
    
    
    var viewModel : TaskDetailViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        
    }

    @IBAction func tabbedSaveButton(_ sender: Any) {
        
        guard let title = taskTitleField.text else { return }
        guard let detail = taskDetail.text else { return }
        let taskPresantation = TaskDetailPresentation(title: title, detail: detail, deadline: taskDeadline.date, uuid: UUID())
        viewModel.saveTask(TaskPresentation: taskPresantation)
        navigationController?.popViewController(animated: true)
//        self.task?.title = title
//        self.task?.detail = detail
//        self.task?.deadline = taskDeadline.date
//        viewModel.saveTask(_task: self.task!)
    }
    
    @IBAction func tabbedDeleteButton(_ sender: Any) {
        viewModel.delete()
        navigationController?.popViewController(animated: true)
    }
}
extension TaskDetailViewController: TaskDetailViewModelDelegate {
    
    
    func showTaskDetail(task: TaskDetailPresentation?) {
        taskTitleField.text = task?.title
        taskDetail.text = task?.detail
        taskDeadline.date = task?.deadline ?? Date()
    }
}
    
    
   
