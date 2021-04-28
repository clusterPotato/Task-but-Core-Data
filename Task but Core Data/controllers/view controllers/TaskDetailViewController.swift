//
//  TaskDetailViewController.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - instance
    var task:Task?
    
    //MARK: - iboutlets
    @IBOutlet weak var taskTitleBar: UITextField!
    @IBOutlet weak var taskTextField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPage()
    }
    
    //MARK: - ibactions
    @IBAction func savePressed(_ sender: Any) {
        if let task = task{
            guard let title = taskTitleBar.text, !title.isEmpty else {return}
            task.title = title
            if let notes = taskTextField.text, !notes.isEmpty{
                task.notes = notes
            }
            task.dueDate = datePicker.date
        }else{
            guard let name = taskTitleBar.text, !name.isEmpty else {return}
            TaskController.shared.addTask(name: name, notes: taskTextField.text, dueDate: datePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dateChanged(_ sender: Any) {
    }
    //MARK: - funcs
    func setupPage(){
        guard let task = task else {return}
        taskTitleBar.text = task.title
        if let notes = task.notes{
            taskTextField.text = notes
        }
        if let date = task.dueDate{
            datePicker.date = date
        }
        
    }
    
}
