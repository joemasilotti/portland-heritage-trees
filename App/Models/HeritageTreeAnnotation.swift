import MapKit

class HeritageTreeAnnotation: NSObject {
    let viewModel: HeritageTreeViewModel
    let coordinate: CLLocationCoordinate2D

    init?(viewModel: HeritageTreeViewModel) {
        guard let coordinate = viewModel.coordinate else { return nil }

        self.coordinate = coordinate
        self.viewModel = viewModel
    }
}

extension HeritageTreeAnnotation: MKAnnotation {
    var title: String? { viewModel.uniqueName }
    var subtitle: String? { viewModel.commonName }
}

extension HeritageTreeAnnotation: Annotation {
    var tintColor: UIColor {
        viewModel.isVisited ? defaultColor.withAlphaComponent(0.5) : defaultColor
    }

    private var defaultColor: UIColor { UIColor(.accentColor) }
}
