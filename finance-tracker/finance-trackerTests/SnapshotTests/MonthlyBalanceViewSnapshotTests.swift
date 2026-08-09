import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct MonthlyBalanceViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 2000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 2000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithoutNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 2000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithoutNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 2000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerDateSelectorWithoutNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerWithoutDateSelectorWithNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 2000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerWithoutDateSelectorWithNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 2000,
                                                   expenses: 1000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithDividerWithoutDateSelectorWithNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withDivider,
                                                   earnings: 1000,
                                                   expenses: 1000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 2000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 2000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: true,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithoutNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 2000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithoutNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 2000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerDateSelectorWithoutNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 1000,
                                                   dateSelectorViewData: DateSelectorView.ViewData(month: "Example",
                                                                                                   isNextMonthAvailable: false,
                                                                                                   onPreviousMonthClick: {},
                                                                                                   onNextMonthClick: {}))
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerWithoutDateSelectorWithNextMonthAndNegative() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 2000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerWithoutDateSelectorWithNextMonthAndPositive() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 2000,
                                                   expenses: 1000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testMonthlyBalanceViewWithoutDividerWithoutDateSelectorWithNextMonthAndNeutral() throws {
        let viewData = MonthlyBalanceView.ViewData(style: .withoutDivider,
                                                   earnings: 1000,
                                                   expenses: 1000)
        
        let monthlyBalanceView = MonthlyBalanceView(viewData: viewData)
        
        assertSnapshot(of: monthlyBalanceView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
