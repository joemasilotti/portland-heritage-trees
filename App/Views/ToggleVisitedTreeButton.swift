import SwiftUI

struct ToggleVisitedTreeButton: View {
    @ObservedObject var tree: TreeViewModel

    var body: some View {
        Button(action: { tree.toggleVisited() }) {
            Image(systemName: tree.visitedButtonImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text(tree.visitedButtonText)
                .bold()
        }
        .buttonStyle(SolidButton())
    }
}

struct ToggleVisitedTreeButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleVisitedTreeButton(tree: TreeViewModel.preview)
            .autosizedPreview()
    }
}
