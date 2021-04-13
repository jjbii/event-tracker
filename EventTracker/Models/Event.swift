//
//  Event+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

/// An abstract Entity that is subclassed by all event models.
///
/// Subclasses should override `awakeFromInsert()`, and set the appropriate action value,
/// using primitive accessors. Other default values should be set there as well.
/// This example is from `OpenedAppEvent`:
/// ```
/// public override func awakeFromInsert() {
///     super.awakeFromInsert()
///     self.primitiveActionValue = EventAction.openedApp.rawValue
/// }
/// ```
@objc(Event)
public class Event: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    // MARK: - Attributes
    
    @NSManaged public var createdAt: Date
    @NSManaged private var primitiveCreatedAt: Date
    
    @NSManaged public var actionValue: String
    // Primitive accessors should typically be private, but we mark this one
    // public so it can be accessed by subclasses.
    @NSManaged public var primitiveActionValue: String
    
    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveCreatedAt = Date()
    }
}
