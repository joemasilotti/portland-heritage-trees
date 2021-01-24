import CoreLocation

struct LocationManager {
    private let locationManager = CLLocationManager()

    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func rerequestAuthorization() {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
}
