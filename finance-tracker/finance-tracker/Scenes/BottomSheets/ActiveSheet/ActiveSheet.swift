import SwiftUI

enum ActiveSheet: Identifiable {
    case addExpense
    case addEarning
    case entryInfo
    
    var id: Int {
        hashValue
    }
}

struct ActiveSheetView: View {
    let sheet: ActiveSheet
    
    var body: some View {
        switch sheet {
        case .addExpense:
            Text("")
        case .addEarning:
            Text("")
        case .entryInfo:
            Text("")
        }
    }
}
