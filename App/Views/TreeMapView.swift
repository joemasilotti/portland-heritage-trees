import MapKit
import Model
import SwiftUI

struct TreeMapView: View {
    @EnvironmentObject private var store: TreeStore
    @State private var isActive = false
    @State private var selectedAnnotation: TreeAnnotation?
    private let locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        Group {
            MapView(annotations: store.treeAnnotations) { annotation in
                selectedAnnotation = annotation as? TreeAnnotation
                isActive = true
            }
            .ignoresSafeArea(.all)

            if let tree = selectedAnnotation?.tree {
                NavigationLink(destination: TreeDetailView(tree: tree), isActive: $isActive) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            locationManager.requestAuthorization()
        }
    }
}
