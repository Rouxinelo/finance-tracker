import SwiftUI

struct RecurringTypeSelectorView: View {
    @State var viewData: ViewData
    let onRecurringTypeChange: (RecurringType) -> ()
    
    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(viewData.types, id: \.self) { recurringType in
                RecurringSelectorCell(viewData: RecurringSelectorCell.ViewData(type: recurringType,
                                                                               isSelected: recurringType == viewData.selectedType),
                                      onClick: { type in
                    viewData.selectedType = type
                    onRecurringTypeChange(type)
                })
            }
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension RecurringTypeSelectorView {
    struct ViewData {
        var types: [RecurringType]
        var selectedType: RecurringType
    }
}
