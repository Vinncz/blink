import Foundation

public class RouteRepository : RepositoryProtocol {
    
    public typealias AssociatedModel = Route

    private var busRepoInstance: BusRepository
    private var busStopRepoInstance: BusStopRepository
    private var routes : [Route] = []
    
    init () {
        self.busStopRepoInstance = BusStopRepository()
        self.busRepoInstance = BusRepository()
        
        self.routes = [
            Route(
                name: "AEON - The ICE - The Breeze", 
                buses: [
                    busRepoInstance.get("BSDL001"),
                    busRepoInstance.get("BSDL002"),
                ], 
                stops: [
                    busStopRepoInstance.get("The ICE 5"),
                    busStopRepoInstance.get("CBD Barat 1"),
                    busStopRepoInstance.get("CBD Barat 2"),
                    busStopRepoInstance.get("AEON Mall Lobby"),
                    busStopRepoInstance.get("AEON Mall 2"),
                    busStopRepoInstance.get("CBD Timur 2"),
                    busStopRepoInstance.get("Nava Park 1"),
                    busStopRepoInstance.get("Greencove")
                ]
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
