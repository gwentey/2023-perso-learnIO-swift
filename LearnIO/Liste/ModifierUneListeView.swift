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
            TextField("Nom de la liste", text: $liste.nom)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()

            Spacer()

            Button(action: {

            }) {
                Text("Modifier la liste")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                    )
            }
            Spacer()
        }
        .navigationBarTitle("Modifier : " + liste.nom)
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
