import SwiftUI
import MapKit

struct BSDLinkRoute: Identifiable {
    var id = UUID()
    
    var name: String = ""
}

let routes:[BSDLinkRoute] = [
    BSDLinkRoute(name: "SML Intermoda"),
    BSDLinkRoute(name: "CBD Intermoda"),
    BSDLinkRoute(name: "Intermoda De'Park (Rute 1)"),
    BSDLinkRoute(name: "Intermoda De'Park (Rute 2)"),
    BSDLinkRoute(name: "Greenwich Sektor 1.3"),
]

struct RouteRow: View {
    var route: BSDLinkRoute
    
    var body: some View {
        HStack () {
            Text(route.name)
            
            Spacer()
        }
    }
}

struct RouteDetail: View {
    @State var binded = false
    
    let coordinate = CLLocationCoordinate2D(latitude: -6.302450, longitude: 106.652030)
    let coordinate1 = CLLocationCoordinate2D(latitude: -6.302, longitude: 106.652032)
    let coordinate2 = CLLocationCoordinate2D(latitude: -6.303, longitude: 106.652034)
    let coordinate3 = CLLocationCoordinate2D(latitude: -6.304, longitude: 106.652036)
    var route: BSDLinkRoute
    
    func doNothing () {
        binded = !binded
    }
    
    var body: some View {
        VStack {
            Map (position: .constant(.region(region))) {
                Marker("Your Location", coordinate: coordinate)
                Marker("Halte 1", coordinate: coordinate1)
                Marker("Halte 2", coordinate: coordinate2)
                Marker("Halte 3", coordinate: coordinate3)
                Marker("Station", coordinate: CLLocationCoordinate2D.cisaukStation)

            }
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                MapPitchToggle()
                
            }
            .sheet(isPresented: $binded, content: {
                Text("This is a drawer")
                    .presentationDetents([.height(250)])
            })
            Button(action: doNothing) {
                Text("Toggle Timetable")
            }
            .navigationTitle(route.name)
            .toolbarBackground(Color.clear, for: .automatic)
        }
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.04)
        )
    }
}

struct ContentView: View {
    @State var from: String = "Contoh Departure"
    @State var to: String   = "Contoh Destination"
    
    var body: some View {
        VStack {
            TextField("Departure point", text: $from)
            Text($from.wrappedValue)
            
            TextField("Destination", text: $to)
            Text($to.wrappedValue)
        }
        
        NavigationStack {
            List (routes) { r in
                NavigationLink {
                    RouteDetail(route: r)
                } label: {
                    RouteRow(route: r)                    
                }
            }
            .navigationTitle("Routes")
        } 
    }
}

#Preview {
    ContentView()
}

