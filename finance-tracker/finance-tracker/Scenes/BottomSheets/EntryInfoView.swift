import SwiftUI

struct EntryInfoView: View {
    @State var viewData: EntryInfoView.ViewData

    var body: some View {
        VStack(spacing: 18) {
            VStack(spacing: 4) {
                Text(viewData.name)
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(Color.fontWhite)
                Text(viewData.entry.displayName)
                    .font(.system(size: 13))
                    .foregroundStyle(Color.fontSubtitle)
            }

            Text(getSign() + viewData.amount.formattedAmount(currencySymbol: "€"))
                .font(.system(size: 32))
                .foregroundStyle(getExpenseColor())

            VStack(spacing: 0) {
                detailRow(label: "Date", value: viewData.date.dateString)
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 0.5)
                detailRow(label: "Recurring", value: viewData.recurringType.infoString)
            }
            .padding(.horizontal, 14)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            if viewData.isRecurringEntry {
                recurrenceInfoView
            }
            
            HStack(spacing: 10) {
                Button {
                    viewData.onEditAction(getEditableViewData())
                } label: {
                    Text("Edit")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.fontWhite)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.white.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Button {
                    viewData.onDeleteAction(viewData.entryId)
                } label: {
                    Text("Delete")
                        .font(.system(size: 14))
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.red.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .padding(22)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

private extension EntryInfoView {
    func detailRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 13))
                .foregroundStyle(Color.fontSubtitle)
            Spacer()
            Text(value)
                .font(.system(size: 13))
                .foregroundStyle(Color.fontWhite)
        }
        .padding(.vertical, 11)
    }
    
    @ViewBuilder
    var recurrenceInfoView: some View {
        if viewData.recurrenceStopDate == nil {
            recurrenceActiveView
        } else {
           recurrenceStoppedView
        }
    }
    
    var recurrenceActiveView: some View {
        HStack {
            Text("Recurrence active")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color.fontWhite)
            
            Spacer()
            
            Button(action: {
                cancelEntryRecurrence()
            }) {
                Text("Stop")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(Color.red)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
            }
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    var recurrenceStoppedView: some View {
        HStack(spacing: 8) {
            Image(systemName: "minus.circle")
                .foregroundStyle(Color.fontSubtitle)
                .font(.system(size: 15))
            
            VStack(alignment: .leading, spacing: 1) {
                Text("Recurrence stopped")
                    .font(.system(size: 13))
                    .foregroundStyle(Color.fontSubtitle)
                
                Text("Last charge: \(viewData.recurrenceStopDate?.dateString ?? "")")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.fontSubtitle.opacity(0.7))
            }
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.white.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    func cancelEntryRecurrence() {
        viewData.recurrenceStopDate = viewData.lastChargeDate
    }
    
    func getSign() -> String {
        switch viewData.entryType {
        case .spending:
            return "-"
        case .earning:
            return "+"
        }
    }
    
    func getExpenseColor() -> Color {
        switch viewData.entryType {
        case .spending:
            return Color.amountRed
        case .earning:
            return Color.amountGreen
        }
    }
    
    func getEditableViewData() -> AddEntryView.ViewData {
        AddEntryView.ViewData(bottomSheetType: getBottomSheetType(),
                              entryId: viewData.entryId,
                              name: viewData.name,
                              category: viewData.entry,
                              amount: viewData.amount.formattedAmount(),
                              recurringType: viewData.recurringType,
                              categories: viewData.entryType == .earning ? Category.earningCases : Category.expenseCases)
    }
    
    func getBottomSheetType() -> EntryBottomSheetType {
        switch viewData.entryType {
        case .spending:
            return .editExpense
        case .earning:
            return .editEarning
        }
    }
}

extension EntryInfoView {
    struct ViewData {
        let entryId: UUID
        let entryType: EntryType
        let name: String
        let entry: Category
        let amount: Double
        let date: Date
        var lastChargeDate: Date
        var recurrenceStopDate: Date?
        let recurringType: RecurringType
        let onEditAction: (AddEntryView.ViewData) -> Void
        let onDeleteAction: (UUID) -> Void
        
        var isRecurringEntry: Bool {
            recurringType != .once
        }
    }
}
