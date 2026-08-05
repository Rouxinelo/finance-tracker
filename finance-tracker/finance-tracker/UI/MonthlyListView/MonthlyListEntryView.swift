import SwiftUI

struct MonthlyListEntryViewData: Identifiable {
    let id: String
    let name: String
    let category: String
    let amount: String
    let infoButtonAction: (String) -> Void
}

struct MonthlyListEntryView: View {
    @State var viewData: MonthlyListEntryViewData
    
    var body: some View {
        HStack {
            entryViewText
            Spacer()
            HStack(spacing: 10) {
                entryViewAmount
                entryViewInfoButton
            }
        }
        .padding(.vertical, 10)
    }
}

private extension MonthlyListEntryView {
    var entryViewText: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(viewData.name)
                .font(.system(size: 14))
                .foregroundStyle(Color.fontWhite)

            Text(viewData.category)
                .font(.system(size: 12))
                .foregroundStyle(Color.fontSubtitle)
        }
    }
    
    var entryViewAmount: some View {
        Text(viewData.amount)
            .font(.system(size: 14))
            .foregroundStyle(Color.fontWhite)
    }
    
    var entryViewInfoButton: some View {
        Button(action: {
            viewData.infoButtonAction(viewData.id)
        }) {
            Image(systemName: "info.circle")
                .font(.system(size: 16))
                .foregroundStyle(Color.fontSubtitle)
        }
    }
}
