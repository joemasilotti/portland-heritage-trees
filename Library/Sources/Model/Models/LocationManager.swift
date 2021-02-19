import CoreLocation

public struct LocationManager {
    private let locationManager = CLLocationManager()

    public init() {}

    public func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    public func rerequestAuthorization() {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
}
