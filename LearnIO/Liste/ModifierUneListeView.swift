//
//  ModifierUneListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 11/04/2023.
//

import SwiftUI

struct ModifierUneListeView: View {
    
    @EnvironmentObject var allListes: AllListes
    @State var liste : Liste = Liste(nom: "", cartes: [])
    
    var listeID: UUID?

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
                allListes.objectWillChange.send()

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
        
        .onAppear {
            for aList in allListes.listes where aList.id == listeID {
                self.liste = aList
            }
        }
    }

}

