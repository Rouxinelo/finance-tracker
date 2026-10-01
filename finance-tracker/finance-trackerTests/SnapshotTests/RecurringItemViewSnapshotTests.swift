import Testing
import Foundation
import SnapshotTesting
@testable import finance_tracker

@MainActor
struct RecurringItemViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing

    @Test
    func testRecurringItemView_whenEntryIsEarning_andRecurringIsActive() throws {
        let viewData = RecurringItemView.ViewData(id: UUID(),
                                                  entryName: "Example Entry",
                                                  entryType: .earning,
                                                  entryCategory: .gift,
                                                  recurringType: .daily,
                                                  amount: 10)
        
        let recurringItemView = RecurringItemView(viewData: viewData)
        
        assertSnapshot(of: recurringItemView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testRecurringItemView_whenEntryIsEarning_andRecurringIsStopped() throws {
        let viewData = RecurringItemView.ViewData(id: UUID(),
                                                  entryName: "Example Entry",
                                                  entryType: .earning,
                                                  entryCategory: .gift,
                                                  recurringType: .daily,
                                                  amount: 10,
                                                  recurrenceStopDate: Date(timeIntervalSince1970: 0))
        
        let recurringItemView = RecurringItemView(viewData: viewData)
        
        assertSnapshot(of: recurringItemView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testRecurringItemView_whenEntryIsSpending_andRecurringIsActive() throws {
        let viewData = RecurringItemView.ViewData(id: UUID(),
                                                  entryName: "Example Entry",
                                                  entryType: .spending,
                                                  entryCategory: .gift,
                                                  recurringType: .daily,
                                                  amount: 10)
        
        let recurringItemView = RecurringItemView(viewData: viewData)
        
        assertSnapshot(of: recurringItemView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    func testRecurringItemView_whenEntryIsSpending_andRecurringIsStopped() throws {
        let viewData = RecurringItemView.ViewData(id: UUID(),
                                                  entryName: "Example Entry",
                                                  entryType: .spending,
                                                  entryCategory: .gift,
                                                  recurringType: .daily,
                                                  amount: 10,
                                                  recurrenceStopDate: Date(timeIntervalSince1970: 0))
        
        let recurringItemView = RecurringItemView(viewData: viewData)
        
        assertSnapshot(of: recurringItemView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
