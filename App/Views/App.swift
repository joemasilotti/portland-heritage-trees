import SwiftUI

@main
struct Portland_Heritage_TreesApp: App {
    private let environment = Environment.remote

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(environment.store)
        }
    }
}
