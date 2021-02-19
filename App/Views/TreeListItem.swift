import SwiftUI

struct TreeListItem: View {
    @ObservedObject var tree: TreeViewModel

    var body: some View {
        HStack {
            Text(tree.id)
            Text(tree.commonName)
            Spacer()

            if tree.isVisited {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct TreeListItem_Previews: PreviewProvider {
    static var visitedTreeViewModel: TreeViewModel {
        let viewModel = TreeViewModel.preview
        viewModel.isVisited = true
        return viewModel
    }

    static var previews: some View {
        Group {
            TreeListItem(tree: TreeViewModel.preview)
                .autosizedPreview()

            TreeListItem(tree: visitedTreeViewModel)
                .autosizedPreview()
        }
    }
}
