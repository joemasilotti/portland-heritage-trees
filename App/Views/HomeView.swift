import Model
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var store: TreeStore
    @State private var showingMap = false

    var body: some View {
        NavigationView {
            Group {
                if showingMap {
                    TreeMapView()
                        .navigationBarItems(trailing: listButton)
                } else {
                    TreeListView()
                        .navigationBarItems(trailing: mapButton)
                }
            }
            .navigationBarTitle("Heritage Trees", displayMode: .inline)
        }
    }

    private var mapButton: some View {
        Button(action: { showingMap = true }) {
            Image(systemName: "map")
        }
    }

    private var listButton: some View {
        Button(action: { showingMap = false }) {
            Image(systemName: "list.number")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TreeStore(apiService: Environment.local.apiService))
    }
}
