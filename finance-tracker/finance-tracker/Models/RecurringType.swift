enum RecurringType: String, CaseIterable {
    case once
    case daily
    case weekly
    case halfMonthly
    case monthly
    case quarterYearly
    case halfYearly
    case yearly
}

extension RecurringType {
    var infoString: String {
        switch self {
        case .once:
            return "Once"
        case .daily:
            return "Daily"
        case .weekly:
            return "Weekly"
        case .halfMonthly:
            return "Every 2 weeks"
        case .monthly:
            return "Monthly"
        case .quarterYearly:
            return "Every 3 months"
        case .halfYearly:
            return "Every 6 months"
        case .yearly:
            return "Yearly"
        }
    }
}
