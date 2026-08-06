import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct HeaderViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testHeaderViewWithButton() throws {
        let viewData = HeaderView.ViewData(style: .withButton(buttonAction: {}),
                                           title: "Example Title",
                                           subtitle: "Example Subtitle",
                                           value: "20")
        let headerView = HeaderView(viewData: viewData)
        
        assertSnapshot(of: headerView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testHeaderViewWithoutButton() throws {
        let viewData = HeaderView.ViewData(style: .withoutButton,
                                           title: "Example Title",
                                           subtitle: "Example Subtitle",
                                           value: "20")
        let headerView = HeaderView(viewData: viewData)
        
        assertSnapshot(of: headerView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
