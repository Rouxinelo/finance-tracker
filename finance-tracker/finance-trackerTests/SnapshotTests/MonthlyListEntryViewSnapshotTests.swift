import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct MonthlyListEntryViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testEntryView() throws {
        let viewData = MonthlyListEntryViewData(id: "Example ID",
                                                name: "Example Name",
                                                category: "Example",
                                                amount: "100€",
                                                infoButtonAction: { _ in })
        
        let entryView = MonthlyListEntryView(viewData: viewData)
        
        assertSnapshot(of: entryView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
