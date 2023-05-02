//
//  SentrainerView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 24/04/2023.
//

import SwiftUI
import CoreData

struct SentrainerView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var liste: Liste
    
    @State private var isFlipped = false
    @State var prochaineCarteAReviser: Carte?

    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 4)
                    .frame(width: 350, height: 350)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.05))
                    )
                
                VStack {
                    if(!isFlipped) {
                        Text(prochaineCarteAReviser?.avant ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    } else {
                        Text(prochaineCarteAReviser?.avant ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Divider()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 6)
                        Text(prochaineCarteAReviser?.arriere ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            }.padding(.horizontal)
            
            
            if(!isFlipped){
                Spacer()
                
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation(.spring()) {
                            isFlipped.toggle()
                            prochaineCarteAReviser!.flipSound()

                        }
                    }) {
                        Spacer()
                        Text("Retourner la carte")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                    }
                    .background(Color.blue)
                    
                    
                    
                }
                .background(Color.black.opacity(0.4))
                .clipShape(Capsule())
                .padding(.horizontal, 8)
                .frame(maxHeight: 50)
                
            } else {
                Spacer()
                HStack(spacing: 0) {
                    Button(action: {
                        ajoutDeSessionCarte(carte: prochaineCarteAReviser!, etat: Etat.Echec)
                    }) {
                        Spacer()
                        Text("Echec")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                    }
                    .background(Color.red)
                    
                    Button(action: {
                        ajoutDeSessionCarte(carte: prochaineCarteAReviser!, etat: Etat.Difficile)

                    }) {
                        Spacer()
                        
                        Text("Difficile")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                        
                    }
                    .background(Color.orange)
                    
                    Button(action: {
                        ajoutDeSessionCarte(carte: prochaineCarteAReviser!, etat: Etat.Bon)
                    }) {
                        Spacer()
                        
                        Text("Bon")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                        
                    }
                    .background(Color.green)
                    
                    
                    
                    Button(action: {
                        ajoutDeSessionCarte(carte: prochaineCarteAReviser!, etat: Etat.Facile)
                    }) {
                        Spacer()
                        
                        Text("Facile")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                        
                    }
                    .background(Color.green.opacity(0.6))
                    
                }
                .background(Color.black.opacity(0.4))
                .clipShape(Capsule())
                .padding(.horizontal, 8)
                .frame(maxHeight: 50)
                
            }
        }.onAppear{
            nouvelleCarteAReviser(liste: liste)
        }
    }
    
    func nouvelleCarteAReviser(liste: Liste) {
        if(liste.cartesAReviserAujourdhuiOuAvant().count <= 0) {
            self.presentationMode.wrappedValue.dismiss()
        } else {
            guard let prochaineCarte = liste.cartesAReviserAujourdhuiOuAvant().randomElement() else {
            return }
            self.prochaineCarteAReviser = prochaineCarte
        }
    }
    
    func ajoutDeSessionCarte(carte: Carte, etat: Etat) {
        let session = Session(context: viewContext)
        
        session.etat = etat
        session.date = Date()
        session.carte = carte

        // maj du score
        let points = etatInfos[etat]?.points
        carte.score = carte.score + (points ?? 0)
        print("Sentrainer en cours \n")
        
        carte.determinerDateProchaineRevision()
        
        nouvelleCarteAReviser(liste: liste)
        isFlipped.toggle()
        
        do {
            try viewContext.save()
        }
        catch {
        }
    }
    
    

}



