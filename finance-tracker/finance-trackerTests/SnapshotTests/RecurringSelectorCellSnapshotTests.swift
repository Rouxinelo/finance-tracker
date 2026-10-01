import Testing
import SnapshotTesting
@testable import finance_tracker

@MainActor
struct RecurringSelectorCellSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing

    @Test
    func testRecurringSelectorCell_whenCellIsSelected() throws {
        let viewData = RecurringSelectorCell.ViewData(type: .daily, isSelected: true)
        
        let recurringCell = RecurringSelectorCell(viewData: viewData, onClick: { _ in })
        
        assertSnapshot(of: recurringCell,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testRecurringSelectorCell_whenCellIsNotSelected() throws {
        let viewData = RecurringSelectorCell.ViewData(type: .daily, isSelected: false)
        
        let recurringCell = RecurringSelectorCell(viewData: viewData, onClick: { _ in })

        assertSnapshot(of: recurringCell,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
