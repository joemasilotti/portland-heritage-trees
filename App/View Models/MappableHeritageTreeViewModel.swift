import MapKit

extension HeritageTreeViewModel {
    var annotation: Annotation? { HeritageTreeAnnotation(viewModel: self) }
    var coordinate: CLLocationCoordinate2D? {
        if let lat = tree.properties.lat, let lon = tree.properties.lon {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        return nil
    }
}
