import MapKit
import SwiftUI

struct HeritageTreeMapView: View {
    let coordinate: CLLocationCoordinate2D
    let viewModel: HeritageTreeViewModel

    private let locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: [viewModel]) { _ in
            MapPin(coordinate: coordinate, tint: .accentColor)
        }
        .ignoresSafeArea(.all)
        .onAppear {
            region.center = coordinate
            locationManager.rerequestAuthorization()
        }
    }
}

struct HeritageTreeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeMapView(coordinate: CLLocationCoordinate2D.northWestNeighborhood, viewModel: HeritageTreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
