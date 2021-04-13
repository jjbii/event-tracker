//
//  OpenedAppDailyEvent+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

@objc(OpenedAppDailyEvent)
public class OpenedAppDailyEvent: Event {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<OpenedAppDailyEvent> {
        return NSFetchRequest<OpenedAppDailyEvent>(entityName: "OpenedAppDailyEvent")
    }

    // MARK: - Attributes

    @NSManaged public var day: String
    @NSManaged private var primitiveDay: String
    
    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveActionValue = EventAction.openedAppDaily.rawValue
        self.primitiveDay = DateFormatter.OpenedAppDaily.string(from: Date())
    }
}
