import Foundation
import MapKit

final class BlinkMapViewCoordinator: NSObject, MKMapViewDelegate {
    var control: BlinkMapView

    init(_ control: BlinkMapView) {
        self.control = control
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 6
        
        switch overlay.title {
            case "AEON - The ICE - The Breeze":
                renderer.strokeColor = .blue
            case "Station - Office":
                renderer.strokeColor = .red
            default:
                renderer.strokeColor = .black
        }
        
        return renderer
    }
}
