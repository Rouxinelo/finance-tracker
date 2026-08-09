import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct DateSelectorSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testDateSelectorWithNextMonth() throws {
        let viewData = DateSelectorView.ViewData(month: "Example",
                                                 isNextMonthAvailable: true,
                                                 onPreviousMonthClick: {},
                                                 onNextMonthClick: {})
        
        let entryView = DateSelectorView(viewData: viewData)
        
        assertSnapshot(of: entryView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testDateSelectorWithoutNextMonth() throws {
        let viewData = DateSelectorView.ViewData(month: "Example",
                                                 isNextMonthAvailable: false,
                                                 onPreviousMonthClick: {},
                                                 onNextMonthClick: {})
        
        let entryView = DateSelectorView(viewData: viewData)
        
        assertSnapshot(of: entryView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
