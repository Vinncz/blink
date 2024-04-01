import Foundation

public struct Route : Identifiable {
    public var id = UUID()
    
    var name: String
    var buses: [Bus]?
    var stops: [BusStop]?
}
