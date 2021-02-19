import Model
import SwiftUI

struct TreeDetailView: View {
    let tree: Tree

    @EnvironmentObject private var store: TreeStore
    private var viewModel: VisitableTreeViewModel {
        VisitableTreeViewModel(tree: tree, isVisited: store.isVisited(tree: tree))
    }

    var body: some View {
        ZStack {
            VStack {
                MapView(tree: tree)

                List {
                    NameView(url: viewModel.wikipediaURL, title: tree.commonName, subtitle: tree.scientificName)
                        .padding(.vertical, 8)
                    TreeLocationRow(tree: tree)
                        .padding(.vertical, 8)
                    TreeDimensionsView(height: viewModel.height, spread: viewModel.spread, diameter: viewModel.diameter, circumference: viewModel.circumference)
                        .padding(.vertical, 8)
                    AttributeRow(name: "Notes", value: viewModel.notes)
                        .padding(.vertical, 8)
                    AttributeRow(name: "Tree fact", value: viewModel.treeFact)
                        .padding(.vertical, 8)
                        .padding(.bottom, 64)
                }
            }
            
            VStack {
                Spacer()
                ToggleVisitedTreeButton(tree: tree)
            }
        }
        .navigationBarTitle(viewModel.uniqueName, displayMode: .inline)
    }
}

extension TreeDetailView {
    struct MapView: View {
        let tree: Tree

        var body: some View {
            if let coordinate = tree.coordinate {
                TreeMapDetailView(coordinate: coordinate, tree: tree)
                    .frame(height: 200)
            }
        }
    }
}

struct TreeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDetailView(tree: Tree.preview)
    }
}
