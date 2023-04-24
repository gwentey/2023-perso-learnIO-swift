import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    let persistenceController = PersistenceController.shared

    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            VStack {
                VStack {
                    Image("LogoEtTexte")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 220, height: 220)


                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
