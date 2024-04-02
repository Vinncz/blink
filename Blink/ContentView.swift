import SwiftUI
import MapKit

struct ContentView: View {
    private var routeRepo: RouteRepository = RouteRepository()
    @State public static var eta: [Double] = []
        
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                BlinkMapView(
                    routes: [
//                        routeRepo.get("AEON - The ICE - The Breeze"),
//                        routeRepo.get("Station - Office"),
                        routeRepo.get("Avani - Sektor 1.3")
                    ]
                )
                
                Text("Hello")
                
                VStack {
                    ForEach(ContentView.eta, id: \.self) { et in
                        Text("angka \(et)")
                    }
                }
            }
            .navigationTitle("Avani - Sektor 1.3")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
