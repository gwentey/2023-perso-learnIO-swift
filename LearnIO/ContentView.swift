//
//  ContentView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Contenu de l'application")
            }
            .navigationBarTitle("LearnIO")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: CreeUIView().navigationBarBackButtonHidden(true)){
                            Image("liste")
                                .resizable()
                                .frame(width: 40, height:40)
                        }
                    }
                    Spacer()
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: CreeUIView()) {
                            Image("entrainer")
                                .resizable()
                                .frame(width: 40, height:40)
                        }
                        
                    }
                    Spacer()
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: CreeUIView()) {
                            Image("creer")
                                .resizable()
                                .frame(width: 40, height:40)
                        }
                        
                        
                    }
                    Spacer()
                    
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
