import MapKit

extension Tree {
    public var coordinate: CLLocationCoordinate2D? {
        guard
            let latitude = latitude,
            let longitude = longitude
        else { return nil }

        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
