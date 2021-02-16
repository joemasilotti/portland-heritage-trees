import MapKit

class GreenPinAnnotationView: MKPinAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        pinTintColor = UIColor(.accentColor)
        canShowCallout = true

        let button = UIButton(type: .detailDisclosure)
        rightCalloutAccessoryView = button
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
