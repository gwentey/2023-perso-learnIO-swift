//
//  AfficherListe.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import SwiftUI

struct AfficherUneListe: View {
    
    @Binding var liste : Liste
    @Binding var showNavigationBar: Bool
    
    
    var body: some View {
        
        Spacer()
        Text("Les cartes")
            .font(.headline)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 5) {
                ForEach(liste.cartes) { carte in
                    NavigationLink(destination: AfficherUneListe(liste: Binding.constant(liste), showNavigationBar: $showNavigationBar)) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .padding(5) // Ajouter un padding supplémentaire
                                .overlay(
                                    VStack {
                                        Text(carte.devant)
                                            .font(.system(size: 14))
                                        Divider()
                                        Text(carte.derriere)
                                            .font(.system(size: 14))
                                    }
                                )
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
                   
                   Button(action: {
                       // Code pour le deuxième bouton
                   }) {
                       Image(systemName: "trash")
                   }
               })
               .navigationTitle(liste.nom)
    }
}


struct AfficherUneListe_Previews: PreviewProvider {
    static var previews: some View {
        let liste = Liste(nom: "Liste 1", cartes: [
            Carte(devant: "Avant 1-1", derriere: "Derriere 1-1", dateProchaineRevision: Date()),
            Carte(devant: "Avant 1-2", derriere: "Derriere 1-2", dateProchaineRevision: Date()),
            Carte(devant: "Avant 1-3", derriere: "Derriere 1-3", dateProchaineRevision: Date())
        ])
        return NavigationView {
            AfficherUneListe(liste: Binding.constant(liste), showNavigationBar: Binding.constant(false))
        }
    }
}



