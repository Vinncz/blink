import SwiftUI
import MapKit

struct RouteList: View {
    @State var from: String = "Contoh Departure"
    @State var to: String   = "Contoh Destina"
    
    private var routeRepoInstance: RouteRepository = RouteRepository()
    private var route:Route
    
    init () {
        self.route = routeRepoInstance.get("AEON - The ICE - The Breeze")
    }
    
    var body: some View {
//        VStack {
//            TextField("Departure point", text: $from)
//            Text($from.wrappedValue)
//            
//            TextField("Destination", text: $to)
//            Text($to.wrappedValue)
//        }
//        
//        NavigationStack {
//            ForEach(self.routeRepoInstance.get("AEON - The ICE - The Breeze")) { route in
//                /*@START_MENU_TOKEN@*/Text(route.name)/*@END_MENU_TOKEN@*/
//            }
//            .navigationTitle("Routes")
//        }
        
        Map() {
//            for var stop in self.route.stops {
//                
//            }
        }
    }
}

#Preview {
    RouteList()
}
