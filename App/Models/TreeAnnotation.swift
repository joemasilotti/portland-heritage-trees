import MapKit

class TreeAnnotation: NSObject {
    let coordinate: CLLocationCoordinate2D
    let tree: TreeViewModel

    init?(tree: TreeViewModel) {
        guard let coordinate = tree.coordinate else { return nil }
        self.coordinate = coordinate
        self.tree = tree
    }
}

extension TreeAnnotation: MKAnnotation {
    var title: String? { tree.uniqueName }
    var subtitle: String? { tree.commonName }
}

extension TreeAnnotation: Annotation {
    var identifier: String { tree.id }
    var tintColor: UIColor { tree.tree.visited ? .green : .red }
}
