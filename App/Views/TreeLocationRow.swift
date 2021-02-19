import MapKit
import SwiftUI

struct TreeLocationRow: View {
    let viewModel: TreeViewModel

    var body: some View {
        if let coordinate = viewModel.tree.coordinate {
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
        TreeMapDetailView(coordinate: coordinate, viewModel: viewModel)
            .navigationTitle(viewModel.address ?? "")
    }
}

struct TreeLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        TreeLocationRow(viewModel: TreeViewModel.preview)
            .autosizedPreview()
    }
}
