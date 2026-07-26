import SwiftUI

enum ActiveSheet: Identifiable {
    case addExpense
    case addEarning
    case entryInfo(EntryInfoView.ViewData)
    
    var id: String {
        switch self {
        case .addExpense:
            return "addExpense"
        case .addEarning:
            return "addEarning"
        case .entryInfo(let viewData):
            return viewData.entryId
        }
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
        case .entryInfo(let viewData):
            EntryInfoView(viewData: viewData)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }
}
