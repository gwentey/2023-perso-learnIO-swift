import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // AppBarView not collapse ?
    @State private var show = true
    @State private var choice = 0
    @State private var showFloatingButton = true

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    AppBarView(show: self.$show, selection: $choice)
                    
                    TabView(selection: $choice) {
                        AfficherLesListesAReviserView(show: self.$show)
                            .environment(\.managedObjectContext, viewContext)
                            .tag(0)
                        
                        AfficherLesListesApprisesView(show: self.$show)
                            .environment(\.managedObjectContext, viewContext)
                            .tag(1)
                        
                        CreerUneListeView()
                            .environment(\.managedObjectContext, viewContext)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .navigationBarHidden(true)
                }
                .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Spacer()
                    FloatingButton(show: $showFloatingButton, choice: $choice)
                        .environment(\.managedObjectContext, viewContext)
                        .padding()
                        .opacity(showFloatingButton ? 1.0 : 0.0)
                        .scaleEffect(showFloatingButton ? 1.0 : 0.5)
                        .animation(.easeInOut(duration: 0.2), value: showFloatingButton)

                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


