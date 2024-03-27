import Foundation
import MapKit

public class BusRepository: RepositoryProtocol {
    
    public typealias AssociatedModel = Bus
    
    private let buses : [Bus] = [
        Bus(busCode: "BSDL001", location: CLLocationCoordinate2D.cisaukStation, nextStop: []),
        Bus(busCode: "BSDL002", location: CLLocationCoordinate2D.office, nextStop: []),
//        Bus(busCode: "BSDL003", location: CLLocationCoordinate2D.cisaukStation, pastStop: [], nextStop: []),
//        Bus(busCode: "BSDL004", location: CLLocationCoordinate2D.cisaukStation, pastStop: [], nextStop: []),
//        Bus(busCode: "BSDL005", location: CLLocationCoordinate2D.cisaukStation, pastStop: [], nextStop: []),
    ]
    
    public func getAll () -> [Bus] {
        return self.buses
    }
    
}
