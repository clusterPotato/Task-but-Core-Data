//
//  TaskController.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import CoreData
class TaskController{
    //MARK: - props
    var tasks: [Task] = []
    static let shared = TaskController()
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
        
    }()
    //MARK: - crud
    func addTask(name: String, notes:String?, dueDate:Date?){
        let task = Task(title: name, dueDate: dueDate, notes: notes)
        tasks.append(task)
        CoreDataStack.saveContext()
    }
    func updateTask(_ t: Task){
        CoreDataStack.saveContext()
    }
    func fetchTasks(){
        tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    func deleteTask(_ t: Task){
        guard let index = tasks.firstIndex(of: t) else {return}
        tasks.remove(at: index)
        CoreDataStack.context.delete(t)
        CoreDataStack.saveContext()
    }
    func toggleIsComplete(task:Task){
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
}
