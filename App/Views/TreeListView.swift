import Model
import SwiftUI

struct TreeListView: View {
    @EnvironmentObject private var store: TreeStore

    var body: some View {
        List {
            VisitedTreesProgressView()
                .padding(.vertical)

            ForEach(store.trees) { tree in
                NavigationLink(destination: TreeDetailView(tree: tree)) {
                    TreeListItem(tree: tree)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct TreeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TreeListView()
                .navigationTitle("Trees")
        }
        .environmentObject(Environment.local.store)
    }
}
