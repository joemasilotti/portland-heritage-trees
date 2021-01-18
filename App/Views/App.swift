import SwiftUI

@main
struct Portland_Heritage_TreesApp: App {
    var body: some Scene {
        WindowGroup {
            HeritageTreeListView(environment: .remote)
        }
    }
}
