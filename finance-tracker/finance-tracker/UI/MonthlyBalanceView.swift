import SwiftUI

enum MonthlyBalanceViewStyle {
    case withDivider
    case withoutDivider
}

struct MonthlyBalanceView: View {
    @State var style: MonthlyBalanceViewStyle
    @State var earnings: Double
    @State var expenses: Double

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Monthly Balance")
                        .font(.subheadline)
                        .foregroundStyle(Color.fontSubtitle)
                    
                    Text(formattedAmount)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundStyle(amountColor)
                }
                
                if style == .withDivider {
                    Rectangle()
                        .fill(Color.white.opacity(0.50))
                        .frame(height: 0.5)
                }
            }
            .padding()
        }
    }
    
    var amount: Double {
        earnings - expenses
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
