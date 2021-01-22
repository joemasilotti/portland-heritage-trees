import SwiftUI

struct HeritageTreeListView: View {
    var treeViewModels: [HeritageTreeViewModel]

    var body: some View {
        List(treeViewModels) { viewModel in
            NavigationLink(destination: HeritageTreeDetailView(viewModel: viewModel)) {
                HeritageTreeListItem(viewModel: viewModel)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct HeritageTreeListView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListView(treeViewModels: [HeritageTreeViewModel.preview])
    }
}
