//
//  AfficherLesListesAReviser.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 14/05/2023.
//

import SwiftUI

struct AfficherLesListesAReviserView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selection: Int? = nil
    
    // AppBar collapse ?
    @Binding var show : Bool
    
    // Remplacer la variable 'listes' existante par une variable 'fetchRequest'
    @FetchRequest(
        entity: Liste.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Liste.nom, ascending: true)])
    var fetchRequest: FetchedResults<Liste>
    
    var listes: [Liste] {
        fetchRequest.map { $0 }
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 20) {
                    ForEach(listes.filter { $0.prochaineRevisionDansMoinsDe(99) != nil && ($0.prochaineRevisionDansMoinsDe(99) ?? 0) <= 0 }.sorted(by: { $0.prochaineRevisionDansMoinsDe(99) ?? 0 > $1.prochaineRevisionDansMoinsDe(99) ?? 0 })) { liste in
                        
                        NavigationLink(destination: AfficherUneListeView(selectedListe : liste, fromContentView: true)
                            .environment(\.managedObjectContext, viewContext)
                            .navigationBarBackButtonHidden(true)
                        ) {
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                                    .overlay(
                                        VStack {
                                            Spacer()
                                            Text("\(liste.compterCartes())")
                                                .font(.headline)
                                                .foregroundColor(.blue)
                                            Text(liste.nom ?? "")
                                                .font(.footnote)
                                                .foregroundColor(.gray)
                                            Spacer()
                                            Text(liste.prochaineRevisionDansMoinsDe(99).map { "\($0) jours" } ?? "")
                                                .foregroundColor(.red)
                                                .font(.system(size: 14))
                                            Spacer()
                                        }
                                    )
                            }
                            .frame(width: 110, height: 110)
                        }
                    }
                }.padding(10)
                    .padding(.bottom)
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKeyTools.self, value: -$0.frame(in: .named("scroll")).origin.y)
                    })
            }
            .onPreferenceChange(ViewOffsetKeyTools.self) { offset in
                withAnimation {
                    show = offset > 150 ? false : true
                }
            }
            .coordinateSpace(name: "scroll")
        }
        .onAppear {
            viewContext.refreshAllObjects()
        }
    }
}




