import MapKit
import SwiftUI

class TreeAnnotation: NSObject {
    let coordinate: CLLocationCoordinate2D
    let tree: Tree
    let isVisited: Bool

    init?(tree: Tree, isVisited: Bool) {
        guard let coordinate = tree.coordinate else { return nil }
        self.coordinate = coordinate
        self.tree = tree
        self.isVisited = isVisited
    }
}

extension TreeAnnotation: MKAnnotation {
    var title: String? { "Tree #\(tree.id)" }
    var subtitle: String? { tree.commonName }
}

extension TreeAnnotation: Annotation {
    var identifier: Int { tree.id }
    var tintColor: UIColor { isVisited ? color.withAlphaComponent(0.5) : color }

    private var color: UIColor { UIColor(Color.accentColor) }
}
