//
//  ModifierUneListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI
import CoreData

struct ModifierUneListeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var liste: Liste
    @State var nom: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Nom de la liste", text: $nom)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            Spacer()
            
            Button(action: {
                liste.nom = self.nom
                
                do {
                    try viewContext.save()
                }
                catch {
                    // Handle Error
                }
                
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
        .navigationBarTitle("Modifier : " + liste.nom!)
        .onAppear {
            self.nom = self.liste.nom!
        }
        
    }
}

struct ModifierUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let liste = Liste(context: context)
        liste.nom = "Ma liste"
        return ModifierUneListeView(liste: liste)
    }
}

