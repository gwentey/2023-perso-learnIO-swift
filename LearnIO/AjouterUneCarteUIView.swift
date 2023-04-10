//
//  AjouterUneCarteUIView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import SwiftUI

struct AjouterUneCarteUIView: View {
    @State private var avant = ""
    @State private var arriere = ""
    @State private var carte: Carte = Carte(devant: "", derriere: "")
    @Binding var liste: List
    
    
    var body: some View {
        VStack {
            TextEditor(text: $avant)
                .frame(height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            TextEditor(text: $arriere)
                .frame(height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            Button(action: {
                liste.cartes.append(Carte(devant: avant, derriere: arriere))
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

struct AjouterUneCarteUIView_Previews: PreviewProvider {
    static var previews: some View {
        let liste = List(id: UUID(), nom: "Ma liste", cartes: [])
        return AjouterUneCarteUIView(liste: Binding.constant(liste))
    }
}
