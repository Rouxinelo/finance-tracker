import SwiftUI

struct MonthlyListView: View {
    @State var viewData: ViewData

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(viewData.entries.enumerated()), id: \.element.id) { index, entry in
                MonthlyListEntryView(viewData: entry)

                if index < viewData.entries.count - 1 {
                    Rectangle()
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 0.5)
                }
            }
        }
        .padding(.horizontal, 12)
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 12)
    }
}

extension MonthlyListView {
    struct ViewData {
        let entries: [MonthlyListEntryViewData]
    }
}
