import SwiftUI

struct ContentView: View {
    @State private var selection: Int? = nil
    @State private var listes: [List] = []

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                Text("Accueil")
                
                
                
                    .navigationBarTitle("Accueil")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Accueil")
            }
            .tag(0)
            
            NavigationView {
                SentrainerUIView()
                    .navigationBarTitle("Créer")
            }
            .tabItem {
                Image(systemName: "play.circle")
                Text("S'entrainer")
            }
            .tag(1)
            
            NavigationView {
                CreeUIView(listes: $listes)
                    .navigationBarTitle("Crée")
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Créer")
            }
            .tag(2)
        }
        .navigationBarTitle("LearnIO")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
