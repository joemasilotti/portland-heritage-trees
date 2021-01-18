import SwiftUI

struct HeritageTreeListView: View {
    @ObservedObject var viewModel: HeritageTreeListViewModel

    @State private var showingMap = false

    init(environment: Environment) {
        self.viewModel = HeritageTreeListViewModel(apiSession: environment.apiSession)
    }

    var body: some View {
        NavigationView {
            Group {
                if showingMap {
                    HeritageTreeMapListView(
                        viewModel: MappableHeritageTreeListViewModel(
                            treeViewModels: viewModel.treeViewModels
                        )
                    )
                    .navigationBarItems(trailing: listButton)
                } else {
                    List(self.viewModel.treeViewModels) { viewModel in
                        NavigationLink(destination: HeritageTreeDetailView(viewModel: viewModel)) {
                            HeritageTreeListItem(viewModel: viewModel)
                        }
                        .navigationBarItems(trailing: mapButton)
                    }
                }
            }
            .navigationBarTitle("Heritage Trees", displayMode: .inline)
        }
        .onAppear {
            self.viewModel.getHeritageTrees()
        }
    }

    private var mapButton: some View {
        Button(action: { showingMap = true }) {
            Image(systemName: "map")
        }
    }

    private var listButton: some View {
        Button(action: { showingMap = false }) {
            Image(systemName: "list.number")
        }
    }
}

struct HeritageTreeListView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeListView(environment: .local)
    }
}
