import Foundation
import SwiftData

@Model
final class EntryModel {
    var entryId: UUID
    var name: String
    var amount: Double
    var entryType: String
    var category: String
    var recurringType: String
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
        self.entryType = entryType.rawValue
        self.category = category.rawValue
        self.recurringType = recurringType.rawValue
        self.date = date
        self.recurrenceStopDate = recurrenceStopDate
    }
}
