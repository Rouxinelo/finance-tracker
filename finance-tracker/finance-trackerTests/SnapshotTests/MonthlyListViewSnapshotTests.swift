import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct MonthlyListViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testMonthlyListViewEmpty() throws {
        let viewData = MonthlyListView.ViewData(entries: getEmptyViewData())
        
        let monthlyListView = MonthlyListView(viewData: viewData)
                
        assertSnapshot(of: monthlyListView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyListViewOneElement() throws {
        let viewData = MonthlyListView.ViewData(entries: getViewDataWithOneElement())
        
        let monthlyListView = MonthlyListView(viewData: viewData)
                
        assertSnapshot(of: monthlyListView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyListViewMultipleElements() throws {
        let viewData = MonthlyListView.ViewData(entries: getViewDataWithMultipleElements())
        
        let monthlyListView = MonthlyListView(viewData: viewData)
                
        assertSnapshot(of: monthlyListView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}

private extension MonthlyListViewSnapshotTests {
    func getEmptyViewData() -> [MonthlyListEntryViewData] {
        []
    }
    
    func getViewDataWithOneElement() -> [MonthlyListEntryViewData] {
        [
            MonthlyListEntryViewData(id: "Example ID",
                                     name: "Example name",
                                     category: "Example",
                                     amount: "1000 €",
                                     infoButtonAction: { _ in })
        ]
    }
    
    func getViewDataWithMultipleElements() -> [MonthlyListEntryViewData] {
        [
            MonthlyListEntryViewData(id: "Example ID",
                                     name: "Example name",
                                     category: "Example",
                                     amount: "1000 €",
                                     infoButtonAction: { _ in }),
            
            MonthlyListEntryViewData(id: "Example ID2",
                                     name: "Example name 2",
                                     category: "Example 2",
                                     amount: "2000 €",
                                     infoButtonAction: { _ in }),
            
            MonthlyListEntryViewData(id: "Example ID3",
                                     name: "Example name 3",
                                     category: "Example 3",
                                     amount: "3000 €",
                                     infoButtonAction: { _ in })
        ]
    }
}
