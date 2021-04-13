//
//  NSManagedObjectContext+additions.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func performChangesAndSave(block: @escaping () -> Void) {
        self.perform {
            block()
            self.saveOrRollback()
        }
    }

    func saveOrRollback() {
        do {
            try self.save()
        } catch let error {
            print("Failed to save context:\n\(error)")
            self.rollback()
        }
    }
}
