import SwiftUI
import SwiftData

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                ContentView()
            }
            
            Tab("Recurring", systemImage: "arrow.triangle.2.circlepath") {
                ContentView()
            }
        }
    }
}
