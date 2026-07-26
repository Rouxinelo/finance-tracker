protocol Entry {
    var displayName: String { get }
}

enum ExpenseType: String, Entry {
    case groceries
    case eatingOut
    case sports
    case transport
    case utilities
    case rent
    case health
    case shopping
    case entertainment
    case travel
    case other
    
    var displayName: String {
        switch self {
        case .groceries:
            return "Groceries"
        case .eatingOut:
            return "Eating Out"
        case .sports:
            return "Sports"
        case .transport:
            return "Transport"
        case .utilities:
            return "Utilities"
        case .rent:
            return "Rent"
        case .health:
            return "Health"
        case .shopping:
            return "Shopping"
        case .entertainment:
            return "Entertainment"
        case .travel:
            return "Travel"
        case .other:
            return "Other"
        }
    }
}

enum EarningType: String, Entry {
    case salary
    case sideJob
    case sideHustle
    case investments
    case gift
    case refund
    case other
    
    var displayName: String {
        switch self {
        case .salary:
            return "Salary"
        case .sideJob:
            return "Side Job"
        case .sideHustle:
            return "Side Hustle"
        case .investments:
            return "Investments"
        case .gift:
            return "Gift"
        case .refund:
            return "Refund"
        case .other:
            return "Other"
        }
    }
}
