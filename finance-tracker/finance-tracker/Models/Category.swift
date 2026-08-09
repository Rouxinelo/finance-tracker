import Foundation

enum Category: String, Hashable, Codable, CaseIterable {
    case groceries
    case eatingOut
    case sports
    case transport
    case utilities
    case rent
    case health
    case shopping
    case leisure
    case travel
    case salary
    case sideJob
    case sideHustle
    case investments
    case gift
    case refund
    case other

    var displayName: String {
        switch self {
        case .groceries: return "Groceries"
        case .eatingOut: return "Eating Out"
        case .sports: return "Sports"
        case .transport: return "Transport"
        case .utilities: return "Utilities"
        case .rent: return "Rent"
        case .health: return "Health"
        case .shopping: return "Shopping"
        case .leisure: return "Leisure"
        case .travel: return "Travel"
        case .salary: return "Salary"
        case .sideJob: return "Side Job"
        case .sideHustle: return "Side Hustle"
        case .investments: return "Investments"
        case .gift: return "Gift"
        case .refund: return "Refund"
        case .other: return "Other"
        }
    }

    static var expenseCases: [Category] {
        [.groceries, .eatingOut, .sports, .transport, .utilities, .rent, .health, .shopping, .leisure, .travel, .other]
    }

    static var earningCases: [Category] {
        [.salary, .sideJob, .sideHustle, .investments, .gift, .refund, .other]
    }
}
