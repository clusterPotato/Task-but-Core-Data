//
//  CoreDataStack.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import CoreData

enum CoreDataStack{
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task_but_Core_Data")
        container.loadPersistentStores { (storeDesctiption, error) in
            if let error = error{
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        return container
    }()
    static var context:NSManagedObjectContext {container.viewContext}
    static func saveContext(){
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
}
