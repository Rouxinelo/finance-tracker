import SwiftUI

struct DateSelectorView: View {
    @State var viewData: ViewData
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                viewData.onPreviousMonthClick()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.fontSubtitle)
            }
            
            Text(viewData.month)
                .font(.headline)
                .foregroundStyle(Color.fontWhite)
            
            Button {
                viewData.onNextMonthClick()
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.fontSubtitle)
                    .opacity(viewData.isNextMonthAvailable ? 1 : 0)
            }
            .disabled(!viewData.isNextMonthAvailable)
        }
    }
}

extension DateSelectorView {
    struct ViewData {
        var month: String
        var isNextMonthAvailable: Bool
        var onPreviousMonthClick: () -> Void
        var onNextMonthClick: () -> Void
    }
}
