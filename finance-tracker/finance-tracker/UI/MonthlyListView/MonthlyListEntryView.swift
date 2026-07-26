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
            VStack(alignment: .leading, spacing: 2) {
                Text(viewData.name)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.fontWhite)

                Text(viewData.category)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.fontSubtitle)
            }

            Spacer()

            HStack(spacing: 10) {
                Text(viewData.amount)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.fontWhite)

                Button(action: {
                    viewData.infoButtonAction(viewData.id)
                }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.fontSubtitle)
                }
            }
        }
        .padding(.vertical, 10)
    }
}
