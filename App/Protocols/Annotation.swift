import MapKit

public protocol Annotation: MKAnnotation {
    var identifier: Int { get }
    var tintColor: UIColor { get }
}
