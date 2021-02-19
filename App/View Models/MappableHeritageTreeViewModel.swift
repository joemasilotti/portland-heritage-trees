import MapKit

extension TreeViewModel {
    var annotation: Annotation? { TreeAnnotation(viewModel: self) }
    var coordinate: CLLocationCoordinate2D? {
        if let lat = tree.properties.lat, let lon = tree.properties.lon {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        return nil
    }
}
