import Foundation

extension Double {
    func formattedAmount(currencySymbol: String? = nil) -> String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", self) + (currencySymbol ?? "")
        } else {
            return String(format: "%.2f", self) + (currencySymbol ?? "")
        }
    }
}
