import MapKit
import SwiftUI

struct HeritageTreeDetailView: View {
    let tree: HeritageTree

    private var viewModel: HeritageTreeViewModel { HeritageTreeViewModel(tree: tree) }

    var body: some View {
        VStack {
            if let coordinate = viewModel.coordinate {
                HeritageTreeMapView(coordinate: coordinate, viewModel: viewModel)
                    .frame(height: 200)
            }
            List {
                HeritageTreeNameView(viewModel: viewModel)
                    .padding(.vertical, 8)
                LocationRow(viewModel: viewModel)
                    .padding(.vertical, 8)
                HeritageTreeDimensionsView(viewModel: viewModel)
                    .padding(.vertical, 8)

                AttributeRow(name: "Notes", value: viewModel.notes)
                    .padding(.vertical, 8)
                AttributeRow(name: "Tree fact", value: viewModel.treeFact)
                    .padding(.vertical, 8)
            }
        }
        .navigationBarTitle(viewModel.uniqueName, displayMode: .inline)
    }
}

private struct LocationRow: View {
    let viewModel: HeritageTreeViewModel

    var body: some View {
        if let coordinate = viewModel.coordinate {
            NavigationLink(destination: mapView(coordinate: coordinate)) {
                content
            }
        } else {
            content
        }
    }

    private var content: some View {
        VStack(alignment: .leading) {
            if let address = viewModel.address {
                Text(address)
            }
            if let neighborhood = viewModel.neighborhood {
                Text(neighborhood)
            }
        }
    }

    private func mapView(coordinate: CLLocationCoordinate2D) -> some View {
        HeritageTreeMapView(coordinate: coordinate, viewModel: viewModel)
            .navigationTitle(viewModel.address ?? "")
    }
}

private struct AttributeRow: View {
    let name: String
    let value: String?

    var body: some View {
        if let value = value {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.gray)
                    .font(.caption)
                Text(value)
            }
        }
    }
}

struct HeritageTreeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeDetailView(tree: HeritageTree.preview)
    }
}
