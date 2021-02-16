import MapKit

class HeritageTreeAnnotation: NSObject, MKAnnotation {
    let viewModel: HeritageTreeViewModel
    let coordinate: CLLocationCoordinate2D
    var title: String? { viewModel.uniqueName }
    var subtitle: String? { viewModel.commonName }

    init?(viewModel: HeritageTreeViewModel) {
        guard let coordinate = viewModel.coordinate else { return nil }

        self.coordinate = coordinate
        self.viewModel = viewModel
    }
}
