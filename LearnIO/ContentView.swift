//
//  ContentView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selection: Int? = nil
    @State private var showNavigationBar = false // Etat pour suivre l'état de la navigation bar
    
    // Remplacer la variable 'listes' existante par une variable 'fetchRequest'
    @FetchRequest(
        entity: Liste.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Liste.nom, ascending: true)])
    var fetchRequest: FetchedResults<Liste>
    
    var listes: [Liste] {
        fetchRequest.map { $0 }
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                VStack {
                    Section(header: Text("Listes à réviser")) {
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 20) {
                                ForEach(listes.filter { $0.prochaineRevisionDansMoinsDe(99) ?? 0 <= 0 }.sorted(by: { liste1, liste2 in
                                    guard let jours1 = liste1.prochaineRevisionDansMoinsDe(99),
                                          let jours2 = liste2.prochaineRevisionDansMoinsDe(99) else {
                                        return false // si l'un des deux n'a pas de prochaine révision, on ne peut pas les comparer
                                    }
                                    return jours1 < jours2 // tri par ordre croissant de la prochaine révision
                                }), id: \.self) { liste in
                                    NavigationLink(destination: AfficherUneListeView(selectedListe : liste, showNavigationBar: $showNavigationBar)
                                        .environment(\.managedObjectContext, viewContext)
                                    ) {
                                        VStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.white)
                                                .shadow(radius: 5)
                                                .overlay(
                                                    VStack {
                                                        Spacer()
                                                        Text("\(liste.compterCartes())")
                                                            .font(.headline)
                                                            .foregroundColor(.blue)
                                                        Text(liste.nom ?? "")
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
                                        .frame(width: 110, height: 110)
                                    }
                                }
                            }.padding(10)
                        }
                    }
                    
                    // Section des listes apprises
                    Section(header: Text("Listes apprises")) {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 20) {
                                ForEach(listes.filter { $0.prochaineRevisionDansMoinsDe(99) == nil }, id: \.self) { liste in
                                    NavigationLink(destination: AfficherUneListeView(selectedListe: liste, showNavigationBar: $showNavigationBar)
                                        .environment(\.managedObjectContext, viewContext)
                                    ) {
                                        VStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.white)
                                                .shadow(radius: 5)
                                                .overlay(
                                                    VStack {
                                                        Spacer()
                                                        Text("\(liste.compterCartes())")
                                                            .font(.headline)
                                                            .foregroundColor(.blue)
                                                        Text(liste.nom ?? "")
                                                            .font(.footnote)
                                                            .foregroundColor(.gray)
                                                        Spacer()
                                                        Text("Apprise")
                                                            .foregroundColor(.green)
                                                            .font(.system(size: 14))
                                                        Spacer()
                                                    }
                                                )
                                        }
                                        .frame(width: 110, height: 110)
                                    }
                                }
                            }.padding(10)
                            
                        }
                    }
                    
                    
                }   .navigationBarTitle("Accueil")
                    .onAppear {
                        viewContext.refreshAllObjects()
                        withAnimation {
                            showNavigationBar = true
                        }
                    }
                
                
            }
            .tabItem {
                Image(systemName: "house")
                Text("Accueil")
            }
            .tag(0)
            
            NavigationView {
                // ...
            }
            .tabItem {
                Image(systemName: "play.circle")
                Text("S'entrainer")
            }
            .tag(1)
            
            NavigationView {
                CreerUneListeView()
                    .environment(\.managedObjectContext, viewContext)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
