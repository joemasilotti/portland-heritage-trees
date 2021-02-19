import MapKit
import SwiftUI

public class TreeAnnotation: NSObject {
    public let coordinate: CLLocationCoordinate2D
    public let tree: Tree
    let isVisited: Bool

    init?(tree: Tree, isVisited: Bool) {
        guard let coordinate = tree.coordinate else { return nil }
        self.coordinate = coordinate
        self.tree = tree
        self.isVisited = isVisited
    }
}

extension TreeAnnotation: MKAnnotation {
    public var title: String? { "Tree #\(tree.id)" }
    public var subtitle: String? { tree.commonName }
}

extension TreeAnnotation: Annotation {
    public var identifier: Int { tree.id }
    public var tintColor: UIColor { isVisited ? color.withAlphaComponent(0.5) : color }

    private var color: UIColor { UIColor(Color.accentColor) }
}
