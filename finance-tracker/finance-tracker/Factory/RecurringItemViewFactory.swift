struct RecurringItemViewFactory {
    static func buildViewData(from entry: EntryModel) -> RecurringItemView.ViewData {
        RecurringItemView.ViewData(id: entry.entryId,
                                   entryName: entry.name,
                                   entryType: entry.entryType,
                                   entryCategory: entry.category,
                                   recurringType: entry.recurringType,
                                   amount: entry.amount,
                                   recurrenceStopDate: entry.recurrenceStopDate)
    }
}
