//
//  CreerUneCarteView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI

struct CreerUneCarteView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State var avant : String = ""
    @State var arriere : String = ""
    @ObservedObject var liste : Liste

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

                let carte = Carte(context: viewContext)
                
                carte.avant = avant
                carte.arriere = arriere
                carte.liste = liste
                carte.dateProchaineRevision = Date()

                do {
                    try viewContext.save()
                }
                catch {
                    // Handle Error
                }
                
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

struct CreerUneCarteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.shared.container.viewContext
        let liste = Liste(context: viewContext)
        liste.nom = "Ma liste de test"
        return CreerUneCarteView(liste: liste)
            .environment(\.managedObjectContext, viewContext)
    }
}

