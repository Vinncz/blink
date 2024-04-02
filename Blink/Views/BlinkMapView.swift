import MapKit
import SwiftUI

struct BlinkMapView: UIViewRepresentable {
    var routes: [Route]

    /* Part of protocol's */
    func makeUIView (context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.showsScale = true
        
        return mapView
    }

    /* Part of protocol's */
    func updateUIView (_ blinkMapViewInstance: MKMapView, context: Context) {
        updateOverlays (
            target: blinkMapViewInstance, 
            newOverlay: routes
        )
        
        updateAnnotations (
            from: blinkMapViewInstance
        )
    }
    
    private func updateOverlays(target mapView: MKMapView, newOverlay routes: [Route]) {
        resetOverlays(from: mapView)

        calculateAndAddRoutes(routes: routes, on: mapView, index: 0)
    }

    private func calculateAndAddRoutes(routes: [Route], on mapView: MKMapView, index: Int) {
        guard index < routes.count else { return }

        let route = routes[index]
        let howManyStopsARouteHave = 0..<route.stops.count - 1

        let dispatchGroup = DispatchGroup()

        for i in howManyStopsARouteHave {
            dispatchGroup.enter()
            let sourceCoordinate = route.stops[i].location
            let destinationCoordinate = route.stops[i + 1].location

            calculateAndAddRoute(
                from: sourceCoordinate,
                to: destinationCoordinate,
                on: mapView,
                identifier: route.name
            ) {
                dispatchGroup.leave()
            }
        }

        let theRouteDoLoopBackToBeggining = route.loopBack
        if theRouteDoLoopBackToBeggining {
            dispatchGroup.enter()
            calculateAndAddRoute(
                from: route.stops.last!.location,
                to: route.stops.first!.location,
                on: mapView,
                identifier: route.name
            ) {
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.calculateAndAddRoutes(routes: routes, on: mapView, index: index + 1)
        }
    }

    private func calculateAndAddRoute(from sourceCoordinate: CLLocationCoordinate2D, to destinationCoordinate: CLLocationCoordinate2D, on mapView: MKMapView, identifier: String, completion: @escaping () -> Void) {        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem (
                                      placemark: MKPlacemark (
                                          coordinate: sourceCoordinate
                                      )
                                  )
        directionRequest.destination = MKMapItem (
                                          placemark: MKPlacemark (
                                              coordinate: destinationCoordinate
                                          )
                                       )
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate { response, error in
            guard let route = response?.routes.first else { 
                return 
            }
            
            let polyline = route.polyline
            
            polyline.title = identifier
            mapView.addOverlay(polyline)
            mapView.setVisibleMapRect(polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
            
            route.expectedTravelTime
            
            completion()
        }
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        
        for route in routes {
            route.stops.forEach { busStop in
                guard busStop.showOnMap else {
                    return
                }
                
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = busStop.location
                annotation.title = busStop.name
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    private func resetOverlays ( from blinkMapViewInstance: MKMapView ) {
        blinkMapViewInstance.removeOverlays(
            blinkMapViewInstance.overlays
        )
    }

    func makeCoordinator() -> BlinkMapViewCoordinator {
        Coordinator(self)
    }
}
