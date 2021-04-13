//
//  DateFormatter+Additions.swift
//  EventTracker
//
//  Created by Jack Bransfield on 4/13/21.
//

import Foundation

extension DateFormatter {
    
    static let OpenedAppDaily: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
