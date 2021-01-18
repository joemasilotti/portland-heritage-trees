import MapKit

struct MappableHeritageTreeViewModel: Identifiable {
    var id: String { String(tree.properties.treeID) }
    let coordinate: CLLocationCoordinate2D
    var heritageTreeViewModel: HeritageTreeViewModel { HeritageTreeViewModel(tree: tree) }

    private let tree: HeritageTree

    init?(tree: HeritageTree) {
        guard let latitude = tree.properties.lat, let longitude = tree.properties.lon else { return nil }
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.tree = tree
    }
}
