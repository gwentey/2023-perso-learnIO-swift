//
//  ModifierUneCarteView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI

struct ModifierUneCarteView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    
    @State var avant : String = ""
    @State var arriere : String = ""
    
    @ObservedObject var carte : Carte
    
    
    var body: some View {
        VStack {
            Spacer()
            TextEditor(text: $avant)
                .disableAutocorrection(true)
                .frame(height: 120)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            TextEditor(text: $arriere)
                .disableAutocorrection(true)
                .frame(height: 120)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()
            
            Button(action: {
                
                carte.avant = avant
                carte.arriere = arriere
                
                do {
                    try viewContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                catch {
                    // Handle Error
                }
                
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
        .navigationBarTitle("Modifier une carte")
        .onAppear {
            avant = carte.avant!
            arriere = carte.arriere!
        }
        
    }
    
    func supprimerCarte(carte: Carte) {
        let alert = UIAlertController(title: "Confirmation", message: "Êtes-vous sûr de vouloir supprimer cette carte ?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: .destructive, handler: { _ in
            viewContext.delete(carte)
            do {
                try viewContext.save()
            } catch {
                print("Erreur lors de la suppression de la carte : \(error.localizedDescription)")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let controller = windowScene.windows.first?.rootViewController {
            controller.present(alert, animated: true, completion: nil)
        }
    }

    
}


struct ModifierUneCarteView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let carte = Carte(context: context)
        carte.avant = "Avant"
        carte.arriere = "Arriere"
        
        return ModifierUneCarteView(carte: carte)
    }
}
