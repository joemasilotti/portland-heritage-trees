import SwiftUI

struct HeritageTreeListView: View {
    @ObservedObject var viewModel: HeritageTreeListViewModel

    var body: some View {
        List(viewModel.treeViewModels.indices, id: \.self) { index in
            NavigationLink(destination: HeritageTreeDetailView(viewModel: viewModel.treeViewModels[index])) {
                HeritageTreeListItem(viewModel: viewModel.treeViewModels[index])
            }
        }
        .listStyle(PlainListStyle())
    }
}

 struct HeritageTreeListView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListView(viewModel: HeritageTreeListViewModel.preview)
    }
 }
