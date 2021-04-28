//
//  Task+Convenience.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import CoreData
extension Task{
    @discardableResult convenience init(title:String, dueDate:Date?, notes:String?, isComeplete:Bool = false, context:NSManagedObjectContext = CoreDataStack.context){
        self.init(context:context)
        self.title = title
        self.dueDate = dueDate
        self.isComplete=isComplete
        self.notes = notes
    }
}
