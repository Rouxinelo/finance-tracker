import SnapshotTesting
import Testing
@testable import finance_tracker

@MainActor
struct FullPageLoaderSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testFullPageLoader() throws {
        let viewData = FullPageLoader.ViewData(title: "Example Title")
        
        let fullPageLoader = FullPageLoader(viewData: viewData)
        
        assertSnapshot(of: fullPageLoader,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
