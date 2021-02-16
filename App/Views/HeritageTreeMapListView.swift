import MapKit
import SwiftUI

struct HeritageTreeMapListView: View {
    @ObservedObject var viewModel: HeritageTreeListViewModel
    @Binding var isShowing: Bool

    private let locationManager = LocationManager()
    @State private var selectedAnnotation: HeritageTreeAnnotation?
    @State private var isActive = false

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        Group {
            MapView(annotations: viewModel.treeViewModels.map { $0.annotation }) { annotation in
                selectedAnnotation = annotation as? HeritageTreeAnnotation
                isActive = true
            }
            .ignoresSafeArea(.all)

            if let viewModel = selectedAnnotation?.viewModel {
                NavigationLink(destination: HeritageTreeDetailView(viewModel: viewModel), isActive: $isActive) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            isActive = false
            locationManager.requestAuthorization()
        }
    }
}

struct HeritageTreeMapListView_Previews: PreviewProvider {
    static var previews: some View {
        HeritageTreeMapListView(
            viewModel: HeritageTreeListViewModel.preview,
            isShowing: .constant(true)
        )
    }
}
