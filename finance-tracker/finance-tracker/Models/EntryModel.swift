import Foundation
import SwiftData

@Model
final class EntryModel {
    @Attribute(.unique) var entryId: UUID
    var name: String
    var amount: Double
    var entryType: EntryType
    var category: EntryCategory
    var recurringType: RecurringType
    var date: Date
    var recurrenceStopDate: Date?
    
    init(name: String,
         amount: Double,
         entryType: EntryType,
         category: EntryCategory,
         recurringType: RecurringType,
         date: Date,
         recurrenceStopDate: Date?) {
        self.entryId = UUID()
        self.name = name
        self.amount = amount
        self.entryType = entryType
        self.category = category
        self.recurringType = recurringType
        self.date = date
        self.recurrenceStopDate = recurrenceStopDate
    }
}

extension EntryModel {
    var isRecurring: Bool {
        recurringType != .once
    }
    
    var isRecurringStopped: Bool {
        isRecurring && recurrenceStopDate != nil
    }
}
