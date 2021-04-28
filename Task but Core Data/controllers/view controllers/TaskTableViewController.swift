//
//  TaskTableViewCell.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import UIKit

class TaskTableViewController: UITableViewController {
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.shared.fetchTasks()
    }
    //MARK: - datasource
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTableViewCell else {return UITableViewCell()}
        cell.task = TaskController.shared.tasks[indexPath.row]
        cell.updateCell()
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            TaskController.shared.deleteTask(TaskController.shared.tasks[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    
    //MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TaskDetailViewController{
            guard let index = tableView.indexPathForSelectedRow else {return}
            destination.task = TaskController.shared.tasks[index.row]
        }
    }
}
