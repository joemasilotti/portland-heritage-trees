import MapKit
import SwiftUI

struct HeritageTreeMapListView: View {
    let viewModel: MappableHeritageTreeListViewModel

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: viewModel.treeViewModels) { viewModel in
            MapAnnotation(coordinate: viewModel.coordinate) {
                NavigationLink(destination: HeritageTreeDetailView(viewModel: viewModel.heritageTreeViewModel)) {
                    HeritageTreeMapAnnotationContent()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeritageTreeMapListView_Previews: PreviewProvider {
    static let viewModel = MappableHeritageTreeListViewModel(
        treeViewModels: [HeritageTreeViewModel.preview]
    )

    static var previews: some View {
        HeritageTreeMapListView(viewModel: viewModel)
    }
}
