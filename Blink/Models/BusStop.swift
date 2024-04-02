import Foundation
import MapKit

public class BusStop {
    public var name: String = ""
    public var showOnMap: Bool = false
    public var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    public func visibleOnMap () -> Self {
        self.showOnMap = true
        
        return self
    }
    
    init(name: String, location: CLLocationCoordinate2D) {
        self.name = name
        self.location = location
    }
}
