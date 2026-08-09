import SwiftUI

enum ActiveSheet: Identifiable {
    case addExpense(AddEntryView.ViewData)
    case addEarning(AddEntryView.ViewData)
    case entryInfo(EntryInfoView.ViewData)
    case editEntry(AddEntryView.ViewData)
    
    var id: String {
        switch self {
        case .addExpense(let viewData):
            return viewData.entryId.uuidString
        case .addEarning(let viewData):
            return viewData.entryId.uuidString
        case .entryInfo(let viewData):
            return viewData.entryId.uuidString
        case .editEntry(let viewData):
            return viewData.entryId.uuidString
        }
    }
}

struct ActiveSheetView: View {
    let sheet: ActiveSheet
    
    var body: some View {
        switch sheet {
        case .addExpense(let viewData):
            AddEntryView(viewData: viewData, onSaveAction: { _ in })
        case .addEarning(let viewData):
            AddEntryView(viewData: viewData, onSaveAction: { _ in })
        case .entryInfo(let viewData):
            EntryInfoView(viewData: viewData)
        case .editEntry(let viewData):
            AddEntryView(viewData: viewData, onSaveAction: { _ in })
        }
    }
}
