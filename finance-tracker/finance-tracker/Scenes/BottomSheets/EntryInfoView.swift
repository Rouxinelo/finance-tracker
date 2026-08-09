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
                detailRow(label: "Date", value: viewData.date)
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 0.5)
                detailRow(label: "Recurring", value: viewData.isRecurring ? "Yes" : "No")
            }
            .padding(.horizontal, 14)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))

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
                              isRecurring: viewData.isRecurring,
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
        let date: String
        let isRecurring: Bool
        let onEditAction: (AddEntryView.ViewData) -> Void
        let onDeleteAction: (UUID) -> Void
    }
}
