import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: TreeListViewModel

    @State private var showingMap = false

    init(environment: Environment) {
        self.viewModel = TreeListViewModel(apiSession: environment.apiSession)
    }

    var body: some View {
        NavigationView {
            Group {
                if showingMap {
                    TreeMapListView(
                        viewModel: viewModel,
                        isShowing: $showingMap
                    )
                    .navigationBarItems(trailing: listButton)
                } else {
                    TreeListView(viewModel: viewModel)
                        .navigationBarItems(trailing: mapButton)
                }
            }
            .navigationBarTitle("Heritage Trees", displayMode: .inline)
        }
        .onAppear {
            self.viewModel.getTrees()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(environment: .local)
    }
}
