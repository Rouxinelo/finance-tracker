import SwiftUI
import SwiftData

struct RecurringTabView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \EntryModel.date, order: .reverse) private var entries: [EntryModel]

    private var activeEntries: [EntryModel] {
        entries.filter { $0.isRecurring && !$0.isRecurringStopped }
    }
    
    private var stoppedEntries: [EntryModel] {
        entries.filter { $0.isRecurring && $0.isRecurringStopped }
    }
    
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
            RecurringItemView(viewData: RecurringItemViewFactory.buildViewData(from: entry))
        }
    }
    
    @ViewBuilder
    var stoppedEntriesView: some View {
        Text("Stopped · \(stoppedEntries.count)")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color.fontSubtitle)
        
        ForEach(stoppedEntries) { entry in
            RecurringItemView(viewData: RecurringItemViewFactory.buildViewData(from: entry))
        }
    }
    
    var isEmpty: Bool {
        activeEntries.isEmpty && stoppedEntries.isEmpty
    }
}

#Preview {
    RecurringTabView()
}
