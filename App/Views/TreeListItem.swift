import SwiftUI

struct TreeListItem: View {
    @ObservedObject var viewModel: TreeViewModel

    var body: some View {
        HStack {
            Text(viewModel.id)
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
    static var visitedTreeViewModel: TreeViewModel {
        let viewModel = TreeViewModel.preview
        viewModel.isVisited = true
        return viewModel
    }

    static var previews: some View {
        Group {
            TreeListItem(viewModel: TreeViewModel.preview)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()

            TreeListItem(viewModel: visitedTreeViewModel)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
        }
    }
}
