import SwiftUI

enum MonthlyBalanceViewStyle {
    case withDivider
    case withoutDivider
}

struct MonthlyBalanceView: View {
    @State var viewData: ViewData

    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                if let dateSelectorViewData = viewData.dateSelectorViewData {
                    DateSelectorView(viewData: dateSelectorViewData)
                }
                
                VStack(spacing: 10) {
                    Text("Monthly Balance")
                        .font(.subheadline)
                        .foregroundStyle(Color.fontSubtitle)
                    
                    Text(formattedAmount)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundStyle(amountColor)
                }
                
                if viewData.style == .withDivider {
                    Rectangle()
                        .fill(Color.white.opacity(0.50))
                        .frame(height: 0.5)
                }
            }
            .padding()
        }
    }
    
    var amount: Double {
        viewData.earnings - viewData.expenses
    }
    
    var amountColor: Color {
        if amount > 0 {
            return Color.amountGreen
        } else if amount < 0 {
            return Color.amountRed
        } else {
            return Color.fontWhite
        }
    }
    
    var formattedAmount: String {
        amount.formattedAmount() + " €"
    }
}

extension MonthlyBalanceView {
    struct ViewData {
        var style: MonthlyBalanceViewStyle
        var earnings: Double
        var expenses: Double
        var dateSelectorViewData: DateSelectorView.ViewData?
    }
}
