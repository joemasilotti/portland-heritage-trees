import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HeritageTreeListViewModel

    @State private var showingMap = false
    @State private var selectedTreeViewModel: HeritageTreeViewModel?

    init(environment: Environment) {
        self.viewModel = HeritageTreeListViewModel(apiSession: environment.apiSession)
    }

    var body: some View {
        NavigationView {
            VStack {
                HeritageTreeListView(viewModel: viewModel)
                    .navigationBarItems(trailing: mapButton)
                    .navigationBarTitle("Heritage Trees")

                if let selectedTreeViewModel = selectedTreeViewModel {
                    NavigationLink(
                        "",
                        destination: HeritageTreeDetailView(
                            viewModel: binded(viewModel: selectedTreeViewModel)
                        ),
                        isActive: .constant(true)
                    )
                }
            }
        }
        .sheet(isPresented: $showingMap) {
            mapView
                .navigationBarItems(trailing: listButton)
        }
        .onAppear {
            self.viewModel.getHeritageTrees()
        }
        .onDisappear {
            selectedTreeViewModel = nil
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

    private var mapView: some View {
        HeritageTreeMapListView(
            viewModel: MappableHeritageTreeListViewModel(
                treeViewModels: viewModel.treeViewModels
            ),
            isShowing: $showingMap,
            selectedTreeViewModel: $selectedTreeViewModel
        )
    }

    private func binded(viewModel: HeritageTreeViewModel) -> HeritageTreeViewModel {
        let index = self.viewModel.treeViewModels.firstIndex(where: { $0.id == viewModel.id })!
        return self.viewModel.treeViewModels[index]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(environment: .local)
    }
}
