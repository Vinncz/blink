// Page Home Screen

import SwiftUI

struct HomeScreenView: View {
    var body: some View {

        
        VStack(content: {
            LogoView()
            Text("Blink App")
            
        }).font(.custom("Poppins-Bold", size: 20))


    }
}

#Preview {
    HomeScreenView()
}
