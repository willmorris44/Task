//
//  Task+Convenience.swift
//  Task
//
//  Created by Will morris on 5/8/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
        
    }
    
}
