import SwiftUI

struct TreeListView: View {
    @EnvironmentObject private var store: TreeStore

    var body: some View {
        List(store.trees) { tree in
            NavigationLink(destination: TreeDetailView(tree: tree)) {
                TreeListItem(tree: tree)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct TreeListView_Previews: PreviewProvider {
    static var previews: some View {
        TreeListView()
            .environmentObject(Environment.local.store)
    }
}
