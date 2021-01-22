import SwiftUI

struct HeritageTreeListItem: View {
    @ObservedObject var viewModel: HeritageTreeViewModel

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

struct HeritageTreeListItem_Previews: PreviewProvider {
    static var visitedTreeViewModel: HeritageTreeViewModel {
        let viewModel = HeritageTreeViewModel.preview
        viewModel.isVisited = true
        return viewModel
    }

    static var previews: some View {
        Group {
            HeritageTreeListItem(viewModel: HeritageTreeViewModel.preview)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()

            HeritageTreeListItem(viewModel: visitedTreeViewModel)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
        }
    }
}
