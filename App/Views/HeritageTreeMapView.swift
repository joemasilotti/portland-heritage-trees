import MapKit
import SwiftUI

struct HeritageTreeMapView: View {
    let coordinate: CLLocationCoordinate2D
    let viewModel: HeritageTreeViewModel

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.7617, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [viewModel]) { _ in
            MapPin(coordinate: viewModel.coordinate!)
        }
        .navigationTitle(viewModel.address ?? "")
        .onAppear {
            region.center = coordinate
        }
    }
}

struct HeritageTreeMapView_Previews: PreviewProvider {
    static let coordinate = CLLocationCoordinate2D(
        latitude: 45.528942037138904,
        longitude: -122.69795840197969
    )

    static var previews: some View {
        HeritageTreeMapView(coordinate: coordinate, viewModel: HeritageTreeViewModel.preview)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
