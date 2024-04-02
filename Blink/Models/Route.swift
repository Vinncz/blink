import Foundation

public class Route {    
    var name: String
    var buses: [Bus]
    var stops: [BusStop]
    var loopBack: Bool = false
    var eta: TimeInterval? = nil
    
    init(name: String, buses: [Bus], stops: [BusStop], loopBack: Bool) {
        self.name = name
        self.buses = buses
        self.stops = stops
    }
    
    func doesLoopBack () -> Self {
        self.loopBack = true
        return self
    }
    
    func setEta (eta: TimeInterval) {
        self.eta = eta
    }
}
