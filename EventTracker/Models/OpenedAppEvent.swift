//
//  OpenedAppEvent+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

@objc(OpenedAppEvent)
public class OpenedAppEvent: Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OpenedAppEvent> {
        return NSFetchRequest<OpenedAppEvent>(entityName: "OpenedAppEvent")
    }

    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveActionValue = EventAction.openedApp.rawValue
    }
}
