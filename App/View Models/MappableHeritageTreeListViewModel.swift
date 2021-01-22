import MapKit
import Combine

class MappableHeritageTreeListViewModel: ObservableObject {
    @Published var treeViewModels: [MappableHeritageTreeViewModel]

    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 45.517905, longitude: -122.629721),
            latitudinalMeters: 15000,
            longitudinalMeters: 15000
        )
    }

    init(treeViewModels: [HeritageTreeViewModel]) {
        self.treeViewModels = treeViewModels.compactMap { MappableHeritageTreeViewModel(tree: $0.tree) }
    }
}
