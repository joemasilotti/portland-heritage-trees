import MapKit

public protocol Annotation: MKAnnotation {
    var identifier: String { get }
    var tintColor: UIColor { get }
}
