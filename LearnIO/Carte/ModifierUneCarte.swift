//
//  ModifierUneCarte.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 13/04/2023.
//

import SwiftUI

struct ModifierUneCarte: View {
    
    @Binding var carte: Carte
    
    @State private var avant: String
    @State private var arriere: String
    
    init(carte: Binding<Carte>) {
        self._carte = carte
        _avant = State(initialValue: carte.wrappedValue.devant)
        _arriere = State(initialValue: carte.wrappedValue.derriere)
    }
    
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

                carte.devant = avant;
                carte.derriere = arriere;
                
                avant = ""
                arriere = ""
            }) {
                Text("Modifier la carte")
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
            
            Button(action: {



            }) {
                Text("Modifier la carte")
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
        .navigationTitle("Modifier une carte")
    }
}




struct ModifierUneCarte_Previews: PreviewProvider {
static var previews: some View {
    ModifierUneCarte(carte: .constant(Carte(devant: "Devant", derriere: "Derriere", dateProchaineRevision: Date())))
}
}
