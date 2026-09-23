import SwiftUI

struct RecurringItemView: View {
    let viewData: ViewData
    
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(getExpenseColor())
                .frame(width: 10, height: 50)
            
            VStack(alignment: .leading) {
                Text(viewData.entryName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.fontWhite)
                
                Text(description)
                    .foregroundStyle(Color.fontSubtitle)
            }
            
            Spacer()
            
            Text(getSign() + viewData.amount.formattedAmount(currencySymbol: "€"))
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(getExpenseColor())
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

private extension RecurringItemView {
    func getExpenseColor() -> Color {
        guard viewData.recurrenceStopDate == nil else {
            return Color.gray
        }
        switch viewData.entryType {
        case .spending:
            return Color.amountRed
        case .earning:
            return Color.amountGreen
        }
    }
    
    func getSign() -> String {
        switch viewData.entryType {
        case .spending:
            return "-"
        case .earning:
            return "+"
        }
    }
    
    var description: String {
        if let recurrenceStopDate = viewData.recurrenceStopDate {
            return getStoppedEntryDescription(recurrenceStopDate)
        } else {
            return getActiveEntryDescription()
        }
    }
    
    func getActiveEntryDescription() -> String {
        "\(viewData.recurringType.infoString) · \(viewData.entryCategory.displayName)"
    }
    
    func getStoppedEntryDescription(_ recurrenceStopDate: Date) -> String {
        "\(viewData.recurringType.infoString) · stopped \(recurrenceStopDate.dateStringWithoutYear)"
    }
}

extension RecurringItemView {
    struct ViewData {
        var entryName: String
        var entryType: EntryType
        var entryCategory: EntryCategory
        var recurringType: RecurringType
        var amount: Double
        var recurrenceStopDate: Date?
    }
}

#Preview {
    ZStack {
        Color.backgroundColor
        RecurringItemView(viewData: RecurringItemView.ViewData(entryName: "Antonio's hot wheels",
                                                               entryType: .earning,
                                                               entryCategory: .gift,
                                                               recurringType: .halfMonthly,
                                                               amount: 5))
    }

}
