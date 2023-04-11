//
//  ReviserUneListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 11/04/2023.
//

import SwiftUI

struct ReviserUneListeView: View {
    @Binding var liste : Liste
    
    var body: some View {
        VStack {
            Spacer()
            
        }
        .navigationBarTitle(liste.nom)
    }
}

struct ReviserUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        let liste = Liste(nom: "Liste 1", cartes: [
            Carte(devant: "Avant 1-1", derriere: "Derriere 1-1"),
            Carte(devant: "Avant 1-2", derriere: "Derriere 1-2"),
            Carte(devant: "Avant 1-3", derriere: "Derriere 1-3")
        ])
        ReviserUneListeView(liste: Binding.constant(liste))
    }
}
