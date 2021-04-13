//
//  CompletedActivityEvent+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

@objc(CompletedActivityEvent)
public class CompletedActivityEvent: Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompletedActivityEvent> {
        return NSFetchRequest<CompletedActivityEvent>(entityName: "CompletedActivityEvent")
    }

    // MARK: - Attributes

    @NSManaged public var activityId: Int32
    
    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveActionValue = EventAction.completedActivity.rawValue
    }
}
