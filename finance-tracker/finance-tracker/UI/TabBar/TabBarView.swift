import SwiftUI
import SwiftData

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ContentView()
            }
            
            Tab("Recurring", systemImage: "arrow.triangle.2.circlepath") {
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
        }
    }
}
