//
//  ModifierUneCarte.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 13/04/2023.
//

import SwiftUI

struct ModifierUneCarte: View {
    
    @State private var avant: String = ""
    @State private var arriere: String = ""
    
    @EnvironmentObject var allListes: AllListes
    @State var carte : Carte = Carte(devant: "", derriere: "", dateProchaineRevision: Date())
    
    var carted: Carte
    
    
    
    
    var body: some View {
        
        VStack {
            TextEditor(text: $avant)
                .frame(height: 100)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            TextEditor(text: $arriere)
                .frame(height: 100)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            Button(action: {
                
                carte.devant = avant;
                carte.derriere = arriere;
                self.allListes.objectWillChange.send()

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
        .onAppear{
            self.carte = carted
            
            self.avant = self.carte.devant
            self.arriere = self.carte.derriere

        }
    }
}



