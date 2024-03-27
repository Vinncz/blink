import Foundation
import MapKit

public class Bus {
    var busCode: String
    var location: CLLocationCoordinate2D
    var nextStop: [BusStop]
    
    init () {
        self.busCode = ""
        self.location = CLLocationCoordinate2D()
        self.nextStop = []
    }
    
    init (busCode: String, location: CLLocationCoordinate2D, nextStop: [BusStop]) {
        self.busCode = busCode
        self.location = location
        self.nextStop = nextStop
    }
    
    public func arrivedAtBusStop () -> Void {
        self.nextStop.removeFirst()
    }
    
    public func checkIfRouteHasBeenCompleted () -> Bool {
        return self.nextStop.isEmpty
    }
}
