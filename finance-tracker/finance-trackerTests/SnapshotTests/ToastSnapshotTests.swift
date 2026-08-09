import SnapshotTesting
import Testing
import SwiftUI
@testable import finance_tracker

@MainActor
struct ToastSnapshotTests {
    var recordMode: SnapshotTestingConfiguration.Record = .missing
    
    @Test
    func testToastWithAddStyle() async throws {
        let viewData = Toast.ViewData(style: .add,
                                      expenseTitle: "Example Title",
                                      expenseDescription: "Example Description")
        
        let toast = Toast(isVisible: .constant(true), viewData: viewData, startOffset: 0)
                
        assertSnapshot(of: toast,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testToastWithDeleteStyle() async throws {
        let viewData = Toast.ViewData(style: .delete,
                                      expenseTitle: "Example Title",
                                      expenseDescription: "Example Description")
        
        let toast = Toast(isVisible: .constant(true), viewData: viewData, startOffset: 0)
        
        assertSnapshot(of: toast,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
    
    @Test
    func testToastWithEditStyle() async throws {
        let viewData = Toast.ViewData(style: .edit,
                                      expenseTitle: "Example Title",
                                      expenseDescription: "Example Description")
        
        let toast = Toast(isVisible: .constant(true), viewData: viewData, startOffset: 0)
        
        assertSnapshot(of: toast,
                       as: .image(layout: .device(config: .iPhone13)),
                       record: recordMode)
    }
}
