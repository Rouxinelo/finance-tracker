import SwiftUI

struct RecurringSelectorCell: View {
    let viewData: ViewData
    let onClick: (RecurringType) -> ()
    
    var body: some View {
        Text(viewData.type.infoString)
            .font(.system(size: 13))
            .foregroundStyle(viewData.isSelected ? Color.fontWhite : Color.fontSubtitle)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(viewData.isSelected ? Color.white.opacity(0.1) : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(viewData.isSelected ? Color.clear : Color(.systemGray4).opacity(0.7), lineWidth: 1)
            )
            .contentShape(Rectangle())
            .onTapGesture { onClick(viewData.type) }
    }
}

extension RecurringSelectorCell {
    struct ViewData {
        var type: RecurringType
        var isSelected: Bool = false
    }
}
