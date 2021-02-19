import SwiftUI

struct TreeDetailView: View {
    @ObservedObject var tree: TreeViewModel

    var body: some View {
        ZStack {
            VStack {
                MapView(tree: tree)

                List {
                    NameView(url: tree.wikipediaURL, title: tree.commonName, subtitle: tree.scientificName)
                        .padding(.vertical, 8)
                    TreeLocationRow(viewModel: tree)
                        .padding(.vertical, 8)
                    TreeDimensionsView(height: tree.height, spread: tree.spread, diameter: tree.diameter, circumference: tree.circumference)
                        .padding(.vertical, 8)
                    AttributeRow(name: "Notes", value: tree.notes)
                        .padding(.vertical, 8)
                    AttributeRow(name: "Tree fact", value: tree.treeFact)
                        .padding(.vertical, 8)
                        .padding(.bottom, 64)
                }
            }
            
            VStack {
                Spacer()
                ToggleVisitedTreeButton(tree: tree)
            }
        }
        .navigationBarTitle(tree.uniqueName, displayMode: .inline)
    }
}

extension TreeDetailView {
    struct MapView: View {
        var tree: TreeViewModel

        var body: some View {
            if let coordinate = tree.coordinate {
                TreeMapDetailView(coordinate: coordinate, viewModel: tree)
                    .frame(height: 200)
            }
        }
    }
}

struct TreeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDetailView(tree: TreeViewModel.preview)
    }
}
