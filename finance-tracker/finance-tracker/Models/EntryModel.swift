import Foundation
import SwiftData

@Model
final class EntryModel {
    var entryId: UUID
    var name: String
    var amount: Double
    var entryType: String
    var category: String
    var isRecurring: Bool
    
    init(name: String,
         amount: Double,
         entryType: EntryType,
         category: Category,
         isRecurring: Bool) {
        self.entryId = UUID()
        self.name = name
        self.amount = amount
        self.entryType = entryType.rawValue
        self.category = category.rawValue
        self.isRecurring = isRecurring
    }
}
