//
//  LikedReinforcementCardEvent+CoreDataClass.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//
//

import Foundation
import CoreData

@objc(LikedReinforcementCardEvent)
public class LikedReinforcementCardEvent: Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedReinforcementCardEvent> {
        return NSFetchRequest<LikedReinforcementCardEvent>(entityName: "LikedReinforcementCardEvent")
    }

    // MARK: - Attributes

    @NSManaged public var cardId: Int32
    
    // MARK: - NSManagedObject
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.primitiveActionValue = EventAction.likedReinforcementCard.rawValue
    }
}
