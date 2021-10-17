//
//  TaskDetailViewController.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 15.10.2021.
//

import UIKit

class TaskDetailViewController: UIViewController {
   


    @IBOutlet weak var gtitleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var viewModel : TaskDetailViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
extension TaskDetailViewController: TaskDetailViewModelDelegate {
    func showTaskDetail(task: TaskDetailPresentation) {
        gtitleLabel.text = task.title
        detailLabel.text = task.detail
        let dateFormatter = DateFormatter()

        // Convert Date to String
        dateFormatter.dateStyle = .short
        let stringDate = dateFormatter.string(from: task.deadline)
        dateLabel.text = stringDate
        print(stringDate)
    }
}
    
    
   
