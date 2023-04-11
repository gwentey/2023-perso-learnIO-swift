import SwiftUI

struct ContentView: View {
    @State private var selection: Int? = nil
    @State private var listes: [Liste] = [
        Liste(nom: "Liste 1", cartes: [
            Carte(devant: "Avant 1-1", derriere: "Derriere 1-1"),
            Carte(devant: "Avant 1-2", derriere: "Derriere 1-2"),
            Carte(devant: "Avant 1-3", derriere: "Derriere 1-3")
        ]),
        Liste(nom: "Liste 2", cartes: [
            Carte(devant: "Avant 2-1", derriere: "Derriere 2-1"),
            Carte(devant: "Avant 2-2", derriere: "Derriere 2-2"),
            Carte(devant: "Avant 2-3", derriere: "Derriere 2-3"),
            Carte(devant: "Avant 2-4", derriere: "Derriere 2-4"),
            Carte(devant: "Avant 2-5", derriere: "Derriere 2-5")
        ]),
        Liste(nom: "Liste 3", cartes: [
            Carte(devant: "Avant 3-1", derriere: "Derriere 3-1"),
            Carte(devant: "Avant 3-2", derriere: "Derriere 3-2")
        ]),
        Liste(nom: "Liste 4", cartes: [
            Carte(devant: "Avant 4-1", derriere: "Derriere 4-1"),
            Carte(devant: "Avant 4-2", derriere: "Derriere 4-2"),
            Carte(devant: "Avant 4-3", derriere: "Derriere 4-3"),
            Carte(devant: "Avant 4-4", derriere: "Derriere 4-4")
        ])
    ]
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(listes) { liste in
                            NavigationLink(destination: AfficherUneListe(liste: Binding.constant(liste))) {
                                VStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                        .overlay(
                                            VStack {
                                                Text("\(liste.cartes.count)")
                                                    .font(.headline)
                                                    .foregroundColor(.blue)
                                                Text(liste.nom)
                                                    .font(.footnote)
                                                    .foregroundColor(.gray)
                                            }
                                        )
                                }
                                
                                .frame(width: 150, height: 150)
                            }
                        }
                    }
                    .navigationBarTitle("Accueil")
                    .navigationBarHidden(selection != nil) // cacher la barre de navigation lorsque l'on a cliqué sur une liste
                }
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
                CreeUneListeView(listes: $listes)
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
