//
//  CoreDataStack.swift
//  Task
//
//  Created by Will morris on 5/8/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let persistantContainer = NSPersistentContainer(name: "Task")
        persistantContainer.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Unresolved Error \(error)")
            }
        })
        return persistantContainer
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
}
