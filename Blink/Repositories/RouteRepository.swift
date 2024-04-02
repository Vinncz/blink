import Foundation
import MapKit

public class RouteRepository : RepositoryProtocol {

    private var busRepoInstance: BusRepository
    private var busStopRepoInstance: BusStopRepository
    private var routes : [Route] = []
    
    init () {
        self.busStopRepoInstance = BusStopRepository()
        self.busRepoInstance = BusRepository()
        
        self.routes = [
            Route (
                name: "AEON - The ICE - The Breeze", 
                buses: [
                    busRepoInstance.get("BSDL001"),
                    busRepoInstance.get("BSDL002"),
                ], 
                /* Caution! Kalau beda sequence BusStop-nya, maka akan berbeda juga rute yang ditampilkan! */
                stops: [
                    BusStopRepository.get("The Breeze"),
                    BusStopRepository.get("CBD Timur 1"),
                    BusStopRepository.get("AEON Mall Lobby"),
                    BusStopRepository.get("AEON Mall 2"),
                    BusStopRepository.get("The ICE 5"),
                    BusStopRepository.get("CBD Barat 1"),
                    BusStopRepository.get("CBD Barat 2"),
                    BusStopRepository.get("AEON Mall Lobby"),
                    BusStopRepository.get("AEON Mall 2"),
                    BusStopRepository.get("CBD Timur 2"),
                    BusStopRepository.get("Nava Park 1"),
                    BusStopRepository.get("Greencove"),
                ],
                loopBack: true
            ),
            Route (
                name: "Station - Office",
                buses: [],
                /* Caution! Agar subset dari rute keseluruhan sama-sama melewati jalan yang sama, maka bus stop-nya juga harus sama! */
                stops: [
//                    BusStop(
//                        name: "Office",
//                        location: CLLocationCoordinate2D.office
//                    ),
//                    BusStop(
//                        name: "Station",
//                        location: CLLocationCoordinate2D.cisaukStation
//                    ),
                    BusStopRepository.get("The ICE 5").visibleOnMap(),
                    BusStopRepository.get("CBD Barat 1"),
                    BusStopRepository.get("CBD Barat 2"),
                    BusStopRepository.get("AEON Mall Lobby"),
                    BusStopRepository.get("AEON Mall 2"),
                    BusStopRepository.get("CBD Timur 2"),
                    BusStopRepository.get("Nava Park 1"),
                    BusStopRepository.get("Greencove"),
                    BusStopRepository.get("The Breeze").visibleOnMap()
                ],
                loopBack: false
            ),
            Route (
                name: "Avani - Sektor 1.3", 
                buses: [], 
                stops: [
                    BusStop (
                        name: "Studento 2", 
                        location: CLLocationCoordinate2D(latitude: -6.296203, longitude: 106.64206)
                    ).visibleOnMap(),
                    BusStop (
                        name: "SML Plaza", 
                        location: CLLocationCoordinate2D(latitude: -6.302215, longitude: 106.65121)
                    ).visibleOnMap()
                ], 
                loopBack: false
            )
        ]
    }
    
    public func getAll () -> [Route] {
        return self.routes
    }
    
    public func get (_ id: Int) -> Route {
        return self.routes[0]
    }
    
    public func get (_ routeName: String) -> Route {
        return self.routes.first { route in
            if route.name == routeName {
                return true
            }
            
            return false
        }!
    }
    
    public func update (_ newObject: Route) {
        guard let index = self.routes.firstIndex(where: { $0.name == newObject.name }) else {
            return
        }
        
        self.routes[index] = newObject
    }
    
    public func delete (_ targetObject: Route) {
        guard let index = self.routes.firstIndex(where: { $0.name == targetObject.name }) else {
            return
        }
        
        self.routes.remove(at: index)
    }
}
