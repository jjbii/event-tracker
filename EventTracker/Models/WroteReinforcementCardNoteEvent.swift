//
//  WroteReinforcementCardNoteEvent+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

@objc(WroteReinforcementCardNoteEvent)
public class WroteReinforcementCardNoteEvent: Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WroteReinforcementCardNoteEvent> {
        return NSFetchRequest<WroteReinforcementCardNoteEvent>(entityName: "WroteReinforcementCardNoteEvent")
    }

    // MARK: - Attributes

    @NSManaged public var cardId: Int32

    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveActionValue = EventAction.wroteReinforcementCardNote.rawValue
    }
}
