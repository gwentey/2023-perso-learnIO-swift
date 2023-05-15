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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                
                VStack(spacing: 25) {
                    
                    HStack {
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        
                        Text("LearnIO")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.white)
                        }
                        
                    }.frame(height: 80)
                }
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }?.safeAreaInsets.top)
                .background(PaletteColorTools.one)
                
                
            }
            .edgesIgnoringSafeArea(.all)

        }
        
        
        GeometryReader { _ in
            
            VStack {
                Spacer()
                TextField("Nom de la liste", text: $nom)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(PaletteColorTools.one, lineWidth: 2)
                    )
                    .padding()
                
                Spacer()
                
                Button(action: {
                    let liste = Liste(context: viewContext)
                    liste.nom = self.nom
                    self.nom = ""
                    
                    do {
                        try viewContext.save()
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
                                .stroke(PaletteColorTools.two, lineWidth: 2)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(PaletteColorTools.one)
                                )
                        )
                }
                Spacer()
            }
            
        }
        .onTapGesture {
            KeyboardTools.hideKeyboard()
        }
        .navigationBarBackButtonHidden(true)
    }
}

