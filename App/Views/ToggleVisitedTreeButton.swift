import SwiftUI

struct ToggleVisitedTreeButton: View {
    let tree: Tree

    @EnvironmentObject private var store: TreeStore

    private var viewModel: VisitableTreeViewModel {
        VisitableTreeViewModel(tree: tree, isVisited: store.isVisited(tree: tree))
    }

    var body: some View {
        Button(action: { store.toggleTreeIsVisited(tree) }) {
            Image(systemName: viewModel.visitedButtonImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text(viewModel.visitedButtonText)
                .bold()
        }
        .buttonStyle(SolidButton())
    }
}

struct ToggleVisitedTreeButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleVisitedTreeButton(tree: Tree.preview)
            .autosizedPreview()
    }
}
