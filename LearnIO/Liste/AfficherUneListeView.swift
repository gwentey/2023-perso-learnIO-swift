import SwiftUI

struct AfficherUneListe: View {
    
    @Binding var showNavigationBar: Bool
    @EnvironmentObject var allListes: AllListes
    @State var liste : Liste = Liste(nom: "", cartes: [])
        
    var listeID: UUID?
    @State var i : Int = 0
    
    var body: some View {
        
        Spacer()
        
        Text("Les cartes")
            .font(.headline)
    
        ScrollView {
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 5) {
                ForEach(liste.cartes) { c in
                    NavigationLink(destination: ModifierUneCarte(carted: c).environmentObject(allListes)) {
                        VStack {
                            Spacer()

                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .padding(5) // Ajouter un padding supplémentaire
                                .overlay(
                                    VStack {
                                        Spacer()
                                        Text(c.devant)
                                            .font(.system(size: 14))
                                        Spacer()

                                        Divider()
                                        Spacer()

                                        Text(c.derriere)
                                            .font(.system(size: 14))
                                        Spacer()

                                    }
                                )
                            Spacer()

                        }
                        .frame(width: 100, height: 100)
                    }
                }
            }
        }
        .navigationBarItems(trailing: HStack {
            Button(action: {
                // Code pour le premier bouton
            }) {
                Image(systemName: "play")
            }
            NavigationLink(destination: ModifierUneListeView(listeID: self.listeID).environmentObject(allListes)) {
                Image(systemName: "gear")
            }
            
            Button(action: {
                // Code pour le deuxième bouton
            }) {
                Image(systemName: "trash")
            }
        })
        .navigationTitle(liste.nom)
        .environmentObject(allListes)
        .onAppear {
            self.showNavigationBar = showNavigationBar
            for aList in allListes.listes where aList.id == listeID {
                self.liste = aList
            }
        }

    }
}





