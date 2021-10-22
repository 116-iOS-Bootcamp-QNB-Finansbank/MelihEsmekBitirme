//
//  ViewController.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 10.10.2021.
//

import UIKit

class TaskListViewController: UIViewController,TaskListViewProtocol {
   
//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   var isFiltering = false
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search Task"
        navigationItem.searchController = search

        presenter?.viewDidLoad()
    }
    
    var presenter : TaskListPresenterProtocol?
    var tasks: [TaskListPresentation] = []
   
    var filteredTasks: [TaskListPresentation] = []
    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .showTaskList(let tasks):
            self.tasks = tasks
//            filteredTasks = tasks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func tabbedSortButton(_ sender: Any) {
        self.presenter?.sort()
        
    }
    @IBAction func addedButton(_ sender: Any) {
        presenter?.tabbedAddButton()
    }
    
    
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return CGFloat(15)
        }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
}

extension TaskListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredTasks.count
        }
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath)
       
        cell.backgroundColor = UIColor.white
        
               cell.layer.borderColor = UIColor.black.cgColor
               cell.layer.borderWidth = 1
               cell.layer.cornerRadius = 8
               cell.clipsToBounds = true
        
        if isFiltering{
            cell.textLabel?.text = filteredTasks[indexPath.row].title
        }else {
            cell.textLabel?.text = tasks[indexPath.row].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
         
            self.presenter?.deleteRow(at: indexPath)
            }
        return UISwipeActionsConfiguration(actions: [action])
    }

}

//extension TaskListViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredTasks = tasks.filter({ (task: TaskListPresentation) -> Bool in
//            return task.title.lowercased().contains(searchText.lowercased())
//
//        })
//        isFiltering = true
//        tableView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        isFiltering = false
//        searchBar.text = ""
//        tableView.reloadData()
//    }
//}

extension TaskListViewController: UISearchResultsUpdating {
    
//    var isFiltering: Bool {
//      return searchController.isActive && !isSearchBarEmpty
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filteredTasks = searchText.isEmpty ? tasks : tasks.filter { (task) in
            isFiltering = true
            return task.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }

        tableView.reloadData()
    }


}

