import SwiftUI

struct TreeListItem: View {
    let tree: Tree

    @EnvironmentObject private var store: TreeStore
    private var viewModel: VisitableTreeViewModel {
        VisitableTreeViewModel(tree: tree, isVisited: store.isVisited(tree: tree))
    }

    var body: some View {
        HStack {
            Text(String(viewModel.id))
            Text(viewModel.commonName)
            Spacer()

            if viewModel.isVisited {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct TreeListItem_Previews: PreviewProvider {
    static var previews: some View {
        TreeListItem(tree: Tree.preview)
            .autosizedPreview()
    }
}
