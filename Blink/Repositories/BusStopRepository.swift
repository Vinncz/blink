import Foundation
import MapKit

public class BusStopRepository : RepositoryProtocol {
    
    public typealias AssociatedModel = BusStop
    
    private let busStops : [BusStop] = [
        BusStop(name: "SML Plaza", location: CLLocationCoordinate2D.office)
    ]
    
    public func getAll() -> [BusStop] {
        return busStops
    }
    
}
