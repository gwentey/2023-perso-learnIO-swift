//
//  CreerUneListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI

struct CreerUneListeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var nom = ""
    
    // redirection formulaire est rempli
    @State private var navigateToContentView: ContentView?

    
    var body: some View {
        GeometryReader { _ in
            
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
                    let liste = Liste(context: viewContext)
                    liste.nom = self.nom
                    self.nom = ""
                    
                    do {
                        try viewContext.save()
                        // self.navigateToContentView = ContentView()
                    }
                    catch {
                        // Handle Error
                    }
                    
                }) {
                    Text("Créer la liste")
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

        }
        .onTapGesture {
            KeyboardTools.hideKeyboard()
        }
        .navigationBarTitle("Crée une liste")
        .background(
            NavigationLink(
                destination: navigateToContentView,
                label: { EmptyView() })
        )
    }
}

struct CreerUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        CreerUneListeView()
    }
}
