import SwiftUI

struct HomeView: View {
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
                        viewModel: viewModel,
                        isShowing: $showingMap
                    )
                    .navigationBarItems(trailing: listButton)
                } else {
                    HeritageTreeListView(viewModel: viewModel)
                        .navigationBarItems(trailing: mapButton)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(environment: .local)
    }
}
