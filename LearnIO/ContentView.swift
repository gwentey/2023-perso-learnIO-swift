import SwiftUI

struct ContentView: View {
    @State private var selection: Int? = nil
    @State private var showNavigationBar = false // Etat pour suivre l'état de la navigation bar
    
    @StateObject var allListes: AllListes = AllListes(listes: [
        Liste(nom: "Liste 1", cartes: [
            Carte(devant: "Hello", derriere: "Bonjour", dateProchaineRevision: Date()),
            Carte(devant: "Stay", derriere: "Rester", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
            Carte(devant: "Cat", derriere: "Chat", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 5, to: Date())!)
        ]),
        Liste(nom: "Liste 2", cartes: [
            Carte(devant: "Avant 2-1", derriere: "Derriere 2-1", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Carte(devant: "Avant 2-2", derriere: "Derriere 2-2", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Carte(devant: "Avant 2-3", derriere: "Derriere 2-3", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 7, to: Date())!),
            Carte(devant: "Avant 2-4", derriere: "Derriere 2-4", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 10, to: Date())!),
            Carte(devant: "Avant 2-5", derriere: "Derriere 2-5", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 14, to: Date())!)
        ]),
        Liste(nom: "Liste 3", cartes: [
            Carte(devant: "Avant 3-1", derriere: "Derriere 3-1", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Carte(devant: "Avant 3-2", derriere: "Derriere 3-2", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 6, to: Date())!)
        ]),
        Liste(nom: "Liste 4", cartes: [
            Carte(devant: "Avant 4-1", derriere: "Derriere 4-1", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 8, to: Date())!),
            Carte(devant: "Avant 4-2", derriere: "Derriere 4-2", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 12, to: Date())!),
            Carte(devant: "Avant 4-3", derriere: "Derriere 4-3", dateProchaineRevision: Calendar.current.date(byAdding: .day, value: 15, to: Date())!)
        ])
    ])
    
    var body: some View {
        
        TabView(selection: $selection) {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                       
                        ForEach($allListes.listes) { $liste in
                            
                            NavigationLink(destination: AfficherUneListe(showNavigationBar: $showNavigationBar, listeID: $liste.id).environmentObject(allListes)) {
                                VStack {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                        .overlay(
                                            VStack {
                                                Spacer()
                                                Text("\(liste.cartes.count)")
                                                    .font(.headline)
                                                    .foregroundColor(.blue)
                                                Text(liste.nom)
                                                    .font(.footnote)
                                                    .foregroundColor(.gray)
                                                Spacer()
                                                Text(liste.prochaineRevisionDansMoinsDe(99).map { "\($0) jours" } ?? "")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 14))
                                                Spacer()
                                                
                                            }
                                        )
                                }
                                .frame(width: 150, height: 150)
                                
                            }
                            
                            
                        }
                    }
                    .navigationBarTitle("Accueil")
                    .onAppear {
                        withAnimation {
                            showNavigationBar = true
                        }
                    }
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
                CreeUneListeView(listes: $allListes.listes)
                    .navigationBarTitle("Crée")
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Créer")
            }
            .tag(2)
        }
        .navigationBarTitle("LearnIO")
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
