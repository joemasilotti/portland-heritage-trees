import MapKit
import SwiftUI

struct HeritageTreeMapView: View {
    let coordinate: CLLocationCoordinate2D
    let viewModel: HeritageTreeViewModel

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [viewModel]) { _ in
            MapAnnotation(coordinate: viewModel.coordinate!) {
                HeritageTreeMapAnnotationContent()
            }
        }
        .onAppear {
            region.center = coordinate
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
