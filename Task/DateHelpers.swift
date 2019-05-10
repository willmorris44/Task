//
//  DateHelpers.swift
//  Task
//
//  Created by Will morris on 5/8/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
    
}
