import MapKit
import Model
import SwiftUI

struct TreeMapDetailView: View {
    let coordinate: CLLocationCoordinate2D
    let tree: Tree

    private let locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: [tree]) { _ in
            MapPin(coordinate: coordinate, tint: .accentColor)
        }
        .ignoresSafeArea(.all)
        .onAppear {
            region.center = coordinate
            locationManager.rerequestAuthorization()
        }
    }
}
