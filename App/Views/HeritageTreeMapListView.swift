import MapKit
import SwiftUI

struct HeritageTreeMapListView: View {
    @ObservedObject var viewModel: MappableHeritageTreeListViewModel
    @Binding var isShowing: Bool
    @Binding var selectedTreeViewModel: HeritageTreeViewModel?

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D.northWestNeighborhood,
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: viewModel.treeViewModels) { viewModel in
                MapAnnotation(coordinate: viewModel.coordinate) {
                    HeritageTreeMapAnnotationContent()
                        .onTapGesture {
                            isShowing = false
                            selectedTreeViewModel = viewModel.heritageTreeViewModel
                        }
                }
            }
            .ignoresSafeArea(.all)
            .navigationBarTitle("Heritage Trees", displayMode: .inline)
            .navigationBarItems(trailing: dismissButton)
        }
    }

    private var dismissButton: some View {
        Button(action: { isShowing = false }) {
            Text("Done")
        }
    }
}

struct HeritageTreeMapListView_Previews: PreviewProvider {
    static let viewModel = MappableHeritageTreeListViewModel(
        treeViewModels: [HeritageTreeViewModel.preview]
    )

    static var previews: some View {
        HeritageTreeMapListView(
            viewModel: viewModel,
            isShowing: .constant(true),
            selectedTreeViewModel: .constant(nil)
        )
    }
}
