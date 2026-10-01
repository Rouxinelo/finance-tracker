import SnapshotTesting
import Testing
import SwiftUI
@testable import finance_tracker

@MainActor
struct EmptyStateViewSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testEmptyStateView() throws {
        let viewData = EmptyStateView.ViewData(image: Image(systemName: "folder"),
                                               title: "Example title",
                                               description: "Example description")
        
        let emptyStateView = EmptyStateView(viewData: viewData)
        
        assertSnapshot(of: emptyStateView,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
