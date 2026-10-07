import SwiftUI

enum EntryBottomSheetType {
    case addExpense
    case addEarning
    case editExpense
    case editEarning
}

struct AddEntryView: View {
    @State var viewData: ViewData
    @State var onSaveAction: (ViewData) -> Void
    
    var body: some View {
        VStack(spacing: 18) {
            Text(getTitle())
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(Color.fontWhite)
            
            FieldLabel("Name")
            TextField("", text: $viewData.name)
                .padding(12)
                .background(Color.white.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(Color.fontWhite)
            
            FieldLabel("Category")
            
            VStack {
                ForEach(viewData.categories.subarrays(size: 4), id: \.self) { subarray in
                    HStack(spacing: 4) {
                        ForEach(subarray, id: \.self) { option in
                            Text(option.displayName)
                                .font(.system(size: 13))
                                .foregroundStyle(viewData.category == option ? Color.fontWhite : Color.fontSubtitle)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(viewData.category == option ? Color.white.opacity(0.1) : .clear)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .onTapGesture { viewData.category = option }
                        }
                        
                        if subarray.count < 4 {
                            ForEach(0..<(4 - subarray.count), id: \.self) { _ in
                                Text(" ")
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .opacity(0)
                            }
                        }
                    }
                    .padding(4)
                    .background(Color.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
            FieldLabel("Amount")
            
            HStack {
                TextField("", text: $viewData.amount)
                    .keyboardType(.decimalPad)
                    .padding(12)
                
                Text("€")
                    .padding(.trailing, 12)
            }
            .background(Color.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(Color.fontWhite)
            
            FieldLabel("Frequency")

            RecurringTypeSelectorView(viewData: RecurringTypeSelectorView.ViewData(types: RecurringType.allCases,
                                                                                   selectedType: viewData.recurringType),
                                      onRecurringTypeChange: { type in viewData.recurringType = type })
            
            Button {
                onSaveAction(viewData)
            } label: {
                Text("Save")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color(uiColor: .black))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 13)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(22)
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
    
    private func FieldLabel(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundStyle(Color.fontSubtitle)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getTitle() -> String {
        switch viewData.bottomSheetType {
        case .addExpense:
            "Add Expense"
        case .addEarning:
            "Add Earning"
        case .editExpense:
            "Edit Expense"
        case .editEarning:
            "Edit Earning"
        }
    }
}

extension AddEntryView {
    struct ViewData {
        var bottomSheetType: EntryBottomSheetType
        var entryId: UUID
        var name: String
        var category: EntryCategory?
        var amount: String
        var recurringType: RecurringType
        var categories: [EntryCategory]
        
        init(bottomSheetType: EntryBottomSheetType,
             categories: [EntryCategory]) {
            self.bottomSheetType = bottomSheetType
            self.entryId = UUID()
            self.name = ""
            self.amount = ""
            self.recurringType = .once
            self.categories = categories
        }
        
        init(bottomSheetType: EntryBottomSheetType,
             entryId: UUID,
             name: String,
             category: EntryCategory? = nil,
             amount: String,
             recurringType: RecurringType,
             categories: [EntryCategory]) {
            self.bottomSheetType = bottomSheetType
            self.entryId = entryId
            self.name = name
            self.category = category
            self.amount = amount
            self.recurringType = recurringType
            self.categories = categories
        }
    }
}
