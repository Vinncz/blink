import Foundation
import MapKit

public class BusRepository: RepositoryProtocol {
    
    public typealias AssociatedModel = Bus
    
    private var buses : [Bus] = [
        Bus(busCode: "BSDL001", location: CLLocationCoordinate2D.cisaukStation, nextStop: []),
        Bus(busCode: "BSDL002", location: CLLocationCoordinate2D.office, nextStop: []),
    ]
    
    public func getAll () -> [Bus] {
        return self.buses
    }
    
    public func get(_ id: Int) -> Bus {
        return self.buses[0]
    }
    
    public func get(_ busCode: String) -> Bus {
        return self.buses.first { bus in
            if bus.busCode == busCode {
                return true
            }
            
            return false
        }!
    }
    
    public func update(_ newObject: Bus) {
        guard let index = self.buses.firstIndex(where: { $0.busCode == newObject.busCode }) else {
            return
        }
        
        self.buses[index] = newObject
    }
    
    public func delete(_ targetObject: Bus) {
        guard let index = self.buses.firstIndex(where: { $0.busCode == targetObject.busCode }) else {
            return
        }
        
        self.buses.remove(at: index)
    }
    
}
