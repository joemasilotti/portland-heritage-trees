import SwiftUI

struct HeritageTreeListView: View {
    @ObservedObject var viewModel: HeritageTreeListViewModel

    init(environment: Environment) {
        self.viewModel = HeritageTreeListViewModel(apiSession: environment.apiSession)
    }

    var body: some View {
        NavigationView {
            List(self.viewModel.trees) { tree in
                NavigationLink(destination: HeritageTreeDetailView(tree: tree)) {
                    HeritageTreeListItem(tree: tree)
                }
            }
            .navigationBarTitle("Heritage Trees")
        }
        .onAppear {
            self.viewModel.getHeritageTrees()
        }
    }
}

struct HeritageTreeListView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListView(environment: .local)
    }
}
