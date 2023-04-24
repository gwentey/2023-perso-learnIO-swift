//
//  AfficherListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI

struct AfficherUneListeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var showNavigationBar: Bool
    @ObservedObject var selectedListe: Liste
    
    @FetchRequest var cartes: FetchedResults<Carte>
    
    init(selectedListe: Liste, showNavigationBar: Binding<Bool>) {
        self._showNavigationBar = showNavigationBar
        
        self.selectedListe = selectedListe
        self._cartes = FetchRequest(entity: Carte.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Carte.avant, ascending: true)], predicate: NSPredicate(format: "liste == %@", selectedListe))
    }
    
    var body: some View {
        
        Spacer()
        Text("Les cartes")
            .font(.headline)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 5) {
                ForEach (cartes) { carte in
                    NavigationLink(destination: ModifierUneCarteView(carte: carte)) {
                        
                        VStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .padding(5) // Ajouter un padding supplémentaire
                                .overlay(
                                    VStack {
                                        Spacer()
                                        Text(carte.avant ?? "")
                                            .font(.system(size: 14))
                                        Spacer()
                                        
                                        Divider()
                                        Spacer()
                                        
                                        Text(carte.arriere ?? "")
                                            .font(.system(size: 14))
                                        Spacer()
                                        
                                    }
                                )
                            Spacer()
                        }
                        .frame(width: 100, height: 100)
                        .toolbar(showNavigationBar ? .visible : .hidden, for: .tabBar)
                        .onAppear {
                            withAnimation {
                                showNavigationBar = false
                            }
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing: HStack {
            
            NavigationLink(destination: CreerUneCarteView(liste: selectedListe)
                .environment(\.managedObjectContext, viewContext)
            ) {
                Image(systemName: "plus")
            }
            Button(action: {
                // Code pour le premier bouton
            }) {
                Image(systemName: "play")
            }
            NavigationLink(destination: ModifierUneListeView(liste: selectedListe)
                .environment(\.managedObjectContext, viewContext)
            ) {
                Image(systemName: "gear")
            }
            
            Button(action: {
                // Code pour le deuxième bouton
            }) {
                Image(systemName: "trash")
            }
            
            
        })
        .navigationTitle(selectedListe.nom ?? "")
        
    }
}

struct AfficherUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let liste = Liste(context: context)
        liste.nom = "Ma liste de cours"
        let showNavigationBar = Binding.constant(false)
        
        return NavigationView {
            AfficherUneListeView(selectedListe: liste, showNavigationBar: showNavigationBar)
                .environment(\.managedObjectContext, context)
        }
    }
}
