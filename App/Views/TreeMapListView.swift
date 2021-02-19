import MapKit
import SwiftUI

struct TreeMapListView: View {
    @ObservedObject var viewModel: TreeListViewModel
    @Binding var isShowing: Bool

    private let locationManager = LocationManager()
    @State private var selectedAnnotation: TreeAnnotation?
    @State private var isActive = false

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        Group {
            MapView(annotations: viewModel.treeViewModels.map { $0.annotation }) { annotation in
                selectedAnnotation = annotation as? TreeAnnotation
                isActive = true
            }
            .ignoresSafeArea(.all)

            if let viewModel = selectedAnnotation?.viewModel {
                NavigationLink(destination: TreeDetailView(viewModel: viewModel), isActive: $isActive) {
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

struct TreeMapListView_Previews: PreviewProvider {
    static var previews: some View {
        TreeMapListView(
            viewModel: TreeListViewModel.preview,
            isShowing: .constant(true)
        )
    }
}
