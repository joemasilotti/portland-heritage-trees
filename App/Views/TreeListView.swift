import SwiftUI

struct TreeListView: View {
    @ObservedObject var viewModel: TreeListViewModel

    var body: some View {
        List(viewModel.treeViewModels.indices, id: \.self) { index in
            NavigationLink(destination: TreeDetailView(viewModel: viewModel.treeViewModels[index])) {
                TreeListItem(viewModel: viewModel.treeViewModels[index])
            }
        }
        .listStyle(PlainListStyle())
    }
}

 struct TreeListView_Previews: PreviewProvider {
    static var previews: some View {
        TreeListView(viewModel: TreeListViewModel.preview)
    }
 }
