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
        
        
        guard let title = taskTitleField.text, !title.isEmpty else {
            showAlert()
            return
        }
        guard let detail = taskDetail.text else { return }
        let taskPresantation = TaskDetailPresentation(title: title, detail: detail, deadline: taskDeadline.date, uuid: UUID())
        viewModel.saveTask(TaskPresentation: taskPresantation)
        navigationController?.popViewController(animated: true)

    }
    
    func showAlert(){
                let alert = UIAlertController(title: "Empty Title", message: "You have to fill title", preferredStyle: UIAlertController.Style.alert)

            
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                self.present(alert, animated: true, completion: nil)
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
    
    
   
