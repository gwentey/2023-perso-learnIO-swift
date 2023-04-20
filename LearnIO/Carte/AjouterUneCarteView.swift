//
//  AjouterUneCarteUIView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import SwiftUI

struct AjouterUneCarteView: View {
    @State private var avant = ""
    @State private var arriere = ""

    @Binding var liste: Liste
    
    
    var body: some View {
        VStack {
            
            TextEditor(text: $avant)
                .disableAutocorrection(true)
                .frame(height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            TextEditor(text: $arriere)
                .disableAutocorrection(true)
                .frame(height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            Button(action: {
                liste.cartes.append(Carte(devant: avant, derriere: arriere, dateProchaineRevision: Date()))
                avant = ""
                arriere = ""
            }) {
                Text("Ajouter la carte")
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
        .navigationBarTitle("Crée")
    }
}

struct AjouterUneCarteView_Previews: PreviewProvider {
    static var previews: some View {
        let liste = Liste(nom: "Ma liste", cartes: [])
        return AjouterUneCarteView(liste: Binding.constant(liste))
    }
}
