import MapKit
import Toolbox

extension MapView {
    public class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation as? Annotation {
                parent.didSelectAnnotation?(annotation)
            }
        }

        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let mkAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: AnnotationViewIdentifier, for: annotation)
            guard
                let annotationView = mkAnnotationView as? PinAnnotationView,
                let annotation = annotation as? Annotation
            else { return nil }

            let alphaComponent: CGFloat = annotation.isMuted ? 0.5 : 1
            annotationView.pinTintColor = UIColor(Colors.pinTintColor).withAlphaComponent(alphaComponent)
            return annotationView
        }
    }
}
