//
//  SentrainerView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 24/04/2023.
//

import SwiftUI

struct SentrainerView: View {
    
    // @Environment(\.managedObjectContext) private var viewContext
    
    // @ObservedObject var liste: Liste
    
    @State private var isFlipped = false
    
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
                        Text("Avant")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    } else {
                        Text("Avant")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Divider()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 6)
                        Text("Arriere")
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
                    Button(action: {}) {
                        Spacer()
                        Text("Echec")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                    }
                    .background(Color.red)
                    
                    Button(action: {}) {
                        Spacer()
                        
                        Text("Difficile")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                        
                    }
                    .background(Color.orange)
                    
                    Button(action: {}) {
                        Spacer()
                        
                        Text("Facile")
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity)
                            .padding(.vertical)
                        Spacer()
                        
                    }
                    .background(Color.green)
                    
                    
                    
                    Button(action: {}) {
                        Spacer()
                        
                        Text("Bon")
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
        }
    }
}

struct SentrainerView_Previews: PreviewProvider {
    static var previews: some View {
        SentrainerView()
    }
}
