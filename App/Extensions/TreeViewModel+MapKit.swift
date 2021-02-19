import MapKit

extension TreeViewModel {
    var coordinate: CLLocationCoordinate2D? {
        guard
            let latitude = tree.latitude,
            let longitude = tree.longitude
        else { return nil }

        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
