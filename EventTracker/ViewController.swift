//
//  ViewController.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    let storageProvider = StorageProvider()
    var eventManager: EventManager!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventManager = EventManager(storageProvider: self.storageProvider)
        self.trackEvents()
    }
    
    // MARK: - IBAction

    @IBAction func trackEventsAction(_ sender: Any) {
        self.trackEvents()
    }
}

// MARK: - Private

private extension ViewController {
    
    func trackEvents() {
        print("Track events")
        self.eventManager.trackOpenedApp()
        self.eventManager.trackCompletedActivity(24)
        self.eventManager.trackLikedReinforcementCard(93)
        self.eventManager.trackWroteReinforcementCardNote(57)
    }
}
