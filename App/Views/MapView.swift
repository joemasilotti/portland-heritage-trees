import MapKit
import SwiftUI

private let AnnotationViewIdentifier = "Heritage Tree Annotation View"

struct MapView: UIViewRepresentable {
    let annotations: [MKAnnotation?]
    var didSelectAnnotation: ((MKAnnotation) -> Void)?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.register(GreenPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: AnnotationViewIdentifier)
        addAnnotations(to: mapView)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation {
                parent.didSelectAnnotation?(annotation)
            }
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else { return nil }

            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: AnnotationViewIdentifier, for: annotation)
            return annotationView
        }
    }

    private func addAnnotations(to mapView: MKMapView) {
        let annotations = self.annotations.compactMap { $0 }
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: false)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(annotations: [MKPointAnnotation.example])
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}
