import MapKit

public protocol Annotation: MKAnnotation {
    var identifier: Int { get }
    var isMuted: Bool { get }
}
