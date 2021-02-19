import MapKit
import Model
import SwiftUI

let AnnotationViewIdentifier = "Annotation View"

public struct MapView: UIViewRepresentable {
    var annotations: [Annotation]
    var didSelectAnnotation: ((Annotation) -> Void)?

    public init(annotations: [Annotation], didSelectAnnotation: ((Annotation) -> Void)?) {
        self.annotations = annotations
        self.didSelectAnnotation = didSelectAnnotation
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.register(PinAnnotationView.self, forAnnotationViewWithReuseIdentifier: AnnotationViewIdentifier)
        addAnnotations(to: mapView)
        return mapView
    }

    // TODO: Move to a different object.
    public func updateUIView(_ mapView: MKMapView, context: Context) {
        let existing = mapView.annotations.compactMap { $0 as? Annotation }.sorted(by: { $0.identifier < $1.identifier })
        let diff = annotations.sorted(by: { $0.identifier < $1.identifier }).difference(from: existing) { $0 === $1 }
        for change in diff {
            switch change {
                case .insert(_, let element, _): mapView.addAnnotation(element)
                case .remove(_, let element, _): mapView.removeAnnotation(element)
            }
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func addAnnotations(to mapView: MKMapView) {
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: false)
    }
}
