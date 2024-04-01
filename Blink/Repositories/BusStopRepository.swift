import Foundation
import MapKit

public class BusStopRepository {
    
    public typealias AssociatedModel = BusStop
    
    private static var busStops : [BusStop] = [
        BusStop(name: "SML Plaza",       location: CLLocationCoordinate2D.office),
        BusStop(name: "The ICE 5",       location: CLLocationCoordinate2D(latitude: -6.2974197, longitude: 106.6361500)),
        BusStop(name: "CBD Barat 1",     location: CLLocationCoordinate2D(latitude: -6.2996199, longitude: 106.6412893)),
        BusStop(name: "CBD Barat 2",     location: CLLocationCoordinate2D(latitude: -6.3023602, longitude: 106.6420811)),
        BusStop(name: "AEON Mall Lobby", location: CLLocationCoordinate2D(latitude: -6.3040946, longitude: 106.6437160)),
        BusStop(name: "AEON Mall 2",     location: CLLocationCoordinate2D(latitude: -6.3029910, longitude: 106.6436794)),
        BusStop(name: "CBD Timur 2",     location: CLLocationCoordinate2D(latitude: -6.3011506, longitude: 106.6487003)),
        BusStop(name: "Nava Park 1",     location: CLLocationCoordinate2D(latitude: -6.2999254, longitude: 106.6485412)),
        BusStop(name: "Greencove",       location: CLLocationCoordinate2D(latitude: -6.3003170, longitude: 106.6598802)),
    ]
    
    public static func getAll() -> [BusStop] {
        return busStops
    }
    
    public static func get(_ id: Int) -> BusStop {
        return busStops[0]
    }
    
    public static func get(_ name: String) -> BusStop {
        return busStops.first { busStop in
            if busStop.name == name {
                return true
            }
            
            return false
        }!
    }
    
    public static func update(_ newObject: BusStop) {
        guard let index = busStops.firstIndex(where: { $0.name == newObject.name }) else {
            return
        }
        
        busStops[index] = newObject
    }
    
    public static func delete(_ targetObject: BusStop) {
        guard let index = busStops.firstIndex(where: { $0.name == targetObject.name }) else {
            return
        }
        
        busStops.remove(at: index)
    }
    
}
