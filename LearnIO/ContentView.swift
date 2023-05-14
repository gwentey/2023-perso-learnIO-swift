//
//  ContentView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var show = true
    @State private var choice = 0

    
    var body: some View {

        NavigationView {
            VStack(spacing: 0) {
                AppBarView(show: self.$show, selection: $choice)
                TabView(selection: $choice) {
                    

                    AfficherLesListesAReviserView(show: self.$show)
                        .environment(\.managedObjectContext, viewContext)
                        .tag(0)
                    
                    AfficherLesListesAReviserView(show: self.$show)
                        .environment(\.managedObjectContext, viewContext)
                        .tag(1)
                    
                    CreerUneListeView()
                        .environment(\.managedObjectContext, viewContext)
                        .tag(2)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.all)

        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
    }
}
