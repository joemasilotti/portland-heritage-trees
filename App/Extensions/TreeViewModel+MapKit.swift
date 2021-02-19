import MapKit

extension TreeViewModel {
    var coordinate: CLLocationCoordinate2D? {
        guard
            let latitude = tree.properties.lat,
            let longitude = tree.properties.lon
        else { return nil }

        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
