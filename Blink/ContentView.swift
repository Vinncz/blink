import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
            .mapStyle(.hybrid())
    }
}

struct MapView: UIViewRepresentable {
    let coordinates: [CLLocationCoordinate2D] = 
        BusStopRepository.getAll().map({ bs in
            return bs.location
        })
    

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateOverlays(from: uiView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func updateOverlays(from mapView: MKMapView) {
        mapView.removeOverlays(mapView.overlays)
        for i in 0..<coordinates.count-1 {
            let sourceCoordinate = coordinates[i]
            let destinationCoordinate = coordinates[i+1]
            calculateAndAddRoute(from: sourceCoordinate, to: destinationCoordinate, on: mapView)
        }
        // Add route from last to first coordinate to complete the loop
        let lastCoordinate = coordinates.last!
        let firstCoordinate = coordinates.first!
        calculateAndAddRoute(from: lastCoordinate, to: firstCoordinate, on: mapView)
    }

    private func calculateAndAddRoute(from sourceCoordinate: CLLocationCoordinate2D, to destinationCoordinate: CLLocationCoordinate2D, on mapView: MKMapView) {
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        directionRequest.transportType = .automobile
        let directions = MKDirections(request: directionRequest)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
        }
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 3
            return renderer
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
