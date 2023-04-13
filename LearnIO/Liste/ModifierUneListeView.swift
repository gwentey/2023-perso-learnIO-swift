//
//  ModifierUneListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 11/04/2023.
//

import SwiftUI

struct ModifierUneListeView: View {
    @Binding var liste : Liste
    
    var body: some View {
        VStack {
            Spacer()
            
        }
        .navigationBarTitle(liste.nom)
    }
}

struct ModifierUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        let liste = Liste(nom: "Liste 1", cartes: [
            Carte(devant: "Avant 1-1", derriere: "Derriere 1-1", dateProchaineRevision: Date()),
            Carte(devant: "Avant 1-2", derriere: "Derriere 1-2", dateProchaineRevision: Date()),
            Carte(devant: "Avant 1-3", derriere: "Derriere 1-3", dateProchaineRevision: Date())
        ])
        ModifierUneListeView(liste: Binding.constant(liste))
    }

}
