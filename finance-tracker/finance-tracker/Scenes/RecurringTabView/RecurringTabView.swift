import SwiftUI

struct RecurringTabView: View {
    @State var activeEntries: [RecurringItemView.ViewData]
    @State var stoppedEntries: [RecurringItemView.ViewData]
    
    var body: some View {
        ZStack() {
            Color
                .backgroundColor
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Recurring")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(Color.fontWhite)
                
                if isEmpty {
                    
                    emptyView
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    if !activeEntries.isEmpty {
                        activeEntriesView
                    }
                    
                    if !stoppedEntries.isEmpty {
                        stoppedEntriesView
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

private extension RecurringTabView {
    @ViewBuilder
    var emptyView: some View {
        EmptyStateView(viewData: EmptyStateView.ViewData(image: Image(systemName: "arrow.triangle.2.circlepath"),
                                                         title: "No recurring items yet",
                                                         description: "Expenses and earnings marked as recurring will show up here."))
    }
    
    @ViewBuilder
    var activeEntriesView: some View {
        Text("Active · \(activeEntries.count)")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color.fontSubtitle)
        
        ForEach(activeEntries) { entry in
            RecurringItemView(viewData: entry)
        }
    }
    
    @ViewBuilder
    var stoppedEntriesView: some View {
        Text("Stopped · \(stoppedEntries.count)")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color.fontSubtitle)
        
        ForEach(stoppedEntries) { entry in
            RecurringItemView(viewData: entry)
        }
    }
    
    var isEmpty: Bool {
        activeEntries.isEmpty && stoppedEntries.isEmpty
    }
}

#Preview {
    RecurringTabView(activeEntries: [
        RecurringItemView.ViewData(entryName: "Example earning active",
                                   entryType: .earning,
                                   entryCategory: .refund,
                                   recurringType: .weekly,
                                   amount: 20),
        
        RecurringItemView.ViewData(entryName: "Example spending active",
                                   entryType: .spending,
                                   entryCategory: .eatingOut,
                                   recurringType: .weekly,
                                   amount: 20)
    ],
                     stoppedEntries: [
                        RecurringItemView.ViewData(entryName: "Example stopped",
                                                   entryType: .earning,
                                                   entryCategory: .eatingOut,
                                                   recurringType: .weekly,
                                                   amount: 20,
                                                   recurrenceStopDate: Date())
                     ])
}
