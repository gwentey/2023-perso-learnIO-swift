//
//  ContentView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int? = nil
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Accueil")
                .tabItem {
                    Image(systemName: "house")
                    Text("Accueil")
                }
                .tag(0)
            
            CreeUIView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Créer")
                }
                .tag(1)
        }
        .navigationBarTitle("LearnIO")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
