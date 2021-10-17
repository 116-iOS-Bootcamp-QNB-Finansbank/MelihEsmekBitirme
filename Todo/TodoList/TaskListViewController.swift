//
//  ViewController.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import UIKit

class TaskListViewController: UIViewController,TaskListViewProtocol {
   
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setNavigationBar()
        presenter?.viewDidLoad()
        
    }
    
    var presenter : TaskListPresenterProtocol?
    var tasks: [TaskListPresentation] = []
    
    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .showTaskList(let tasks):
            self.tasks = tasks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func addedButton(_ sender: Any) {
        print("hello")
    }
    
}
extension TaskListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
    
    
}
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath)
    }
}


