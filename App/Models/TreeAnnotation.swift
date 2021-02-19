import MapKit

class TreeAnnotation: NSObject {
    let viewModel: TreeViewModel
    let coordinate: CLLocationCoordinate2D

    init?(viewModel: TreeViewModel) {
        guard let coordinate = viewModel.coordinate else { return nil }

        self.coordinate = coordinate
        self.viewModel = viewModel
    }
}

extension TreeAnnotation: MKAnnotation {
    var title: String? { viewModel.uniqueName }
    var subtitle: String? { viewModel.commonName }
}

extension TreeAnnotation: Annotation {
    var tintColor: UIColor {
        viewModel.isVisited ? defaultColor.withAlphaComponent(0.5) : defaultColor
    }

    private var defaultColor: UIColor { UIColor(.accentColor) }
}
