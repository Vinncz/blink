import SwiftUI

struct RouteList: View {
    var body: some View {
        NavigationStack {
            List (routes) { r in
                NavigationLink {
                    RouteDetail(route: r)
                } label: {
                    RouteRow(route: r)                    
                }
            }
            .navigationTitle("Blink")
        } 
    }
}

#Preview {
    RouteList()
}
