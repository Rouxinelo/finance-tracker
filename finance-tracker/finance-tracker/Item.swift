//
//  Item.swift
//  finance-tracker
//
//  Created by João Rouxinol on 26/07/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
