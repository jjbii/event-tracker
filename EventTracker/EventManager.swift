//
//  EventManager.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//

import Foundation
import CoreData

enum EventAction: String {
    case likedReinforcementCard = "LIKED_REINFORCEMENT_CARD"
    case wroteReinforcementCardNote = "WROTE_REINFORCEMENT_CARD_NOTE"
    case openedApp = "OPENED_APP"
    case openedAppDaily = "OPENED_APP_DAILY"
    case completedActivity = "COMPLETED_ACTIVITY"
}


class EventManager: NSObject {
    
    // MARK: - Properties

    let storageProvider: StorageProvider
    private let eventContext: NSManagedObjectContext

    // MARK: - Initialization

    init(storageProvider: StorageProvider) {
        self.storageProvider = storageProvider
        let eventContext = storageProvider.persistentContainer.newBackgroundContext()
        eventContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        self.eventContext = eventContext

        super.init()
    }
    
    // MARK: - Event Tracking
    
    public func trackOpenedApp() {
        self.eventContext.performChangesAndSave {
            let _ = OpenedAppEvent(context: self.eventContext)
            let _ = OpenedAppDailyEvent(context: self.eventContext)
        }
    }

    public func trackCompletedActivity(_ activityId: Int32) {
        self.eventContext.performChangesAndSave {
            let event = CompletedActivityEvent(context: self.eventContext)
            event.activityId = activityId
        }
    }
    
    public func trackLikedReinforcementCard(_ cardId: Int32) {
        self.eventContext.performChangesAndSave {
            let event = LikedReinforcementCardEvent(context: self.eventContext)
            event.cardId = cardId
        }
    }
    
    public func trackWroteReinforcementCardNote(_ cardId: Int32) {
        self.eventContext.performChangesAndSave {
            let event = WroteReinforcementCardNoteEvent(context: self.eventContext)
            event.cardId = cardId
        }
    }
}
