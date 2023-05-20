//
//  AfficherListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI
import Charts

struct AfficherUneListeView: View {
    
    @State var data: [AfficherUneListeDataGrapheChartBar] = []
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    var contientCartesAReviser: Bool {
        selectedListe.nombreCartesAReviser() > 0
    }
        
    @ObservedObject var selectedListe: Liste
    
    @FetchRequest var cartes: FetchedResults<Carte>
    
    @State private var isReturnClicked = false

    private var fromContentView: Bool?

    
    init(selectedListe: Liste,  fromContentView: Bool? = false) {
        // la liste selectionnée
        self.selectedListe = selectedListe
        self._cartes = FetchRequest(entity: Carte.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Carte.avant, ascending: true)], predicate: NSPredicate(format: "liste == %@", selectedListe))
        
        //permet de mieux rediriger ou fermer la vue
        self.fromContentView = fromContentView
        
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    
                    VStack(spacing: 25) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                if(fromContentView!) {
                                    self.presentationMode.wrappedValue.dismiss()
                                } else {
                                    self.isReturnClicked = true
                                }
                                
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
    
                            
                            NavigationLink(destination: CreerUneCarteView(liste: selectedListe)
                            .environment(\.managedObjectContext, viewContext)
                            ) {
                            Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.white)
                            }
                            
                            NavigationLink(destination: SentrainerView(liste: selectedListe)
                            .environment(\.managedObjectContext, viewContext)
                            ) {
                            Image(systemName: "play")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.white)
                            }
                            .disabled(!contientCartesAReviser)
                            
                            
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
            
            Chart {
                ForEach($data) { $shape in
                    BarMark(
                        x: .value("Shape Type", shape.type),
                        y: .value("Total Count", shape.nombre)
                    )
                    .foregroundStyle(by: .value("Shape Color", shape.couleur))
                }
            }
            .chartLegend(.hidden)
            .frame(height: 150)
            
            
            
            Spacer()
            Text(selectedListe.nom ?? "ERREUR")
            
            Text("Les cartes")
                .font(.headline)
            Text(selectedListe.prochaineRevisionDansMoinsDe(99).map { "\($0) jours" } ?? "")
            
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 5) {
                    ForEach (cartes) { carte in
                        NavigationLink(destination: ModifierUneCarteView(carte: carte)) {
                            
                            VStack {
                                Spacer()
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3)
                                    .padding(5) // Ajouter un padding supplémentaire
                                    .overlay(
                                        VStack {
                                            Spacer()
                                            Text(carte.avant ?? "")
                                                .font(.system(size: 14))
                                            Spacer()
                                            
                                            Divider()
                                            Spacer()
                                            
                                            Text(carte.arriere ?? "")
                                                .font(.system(size: 14))
                                            Spacer()
                                            
                                        }
                                    )
                                Spacer()
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                }.navigationBarBackButtonHidden(true)
            }
            .onAppear{
                data = ChartsTools.GenenerateDataAfficherUneListeDataGrapheChartBar(liste: selectedListe)
                viewContext.refreshAllObjects()

            }

                

            /*
             .navigationBarItems(trailing: HStack {


             NavigationLink(destination: ModifierUneListeView(liste: selectedListe)
             .environment(\.managedObjectContext, viewContext)
             ) {
             Image(systemName: "gear")
             }
             
             Button(action: {
             supprimerUneListe(liste: selectedListe)
             }) {
             Image(systemName: "trash")
             }
             
             
             })
             .navigationTitle(selectedListe.nom ?? "")
             */
            
        }
        .navigationDestination(isPresented: $isReturnClicked){
                ContentView()
                    .environment(\.managedObjectContext, viewContext)
        }

    }


    
    func supprimerUneListe(liste: Liste) {
        let alert = UIAlertController(title: "Confirmation", message: "Êtes-vous sûr de vouloir supprimer cette liste ?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: .destructive, handler: { _ in
            viewContext.delete(liste)
            do {
                try viewContext.save()
            } catch {
                print("Erreur lors de la suppression de la liste : \(error.localizedDescription)")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let controller = windowScene.windows.first?.rootViewController {
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    
}



struct AfficherUneListeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let liste = Liste(context: context)
        liste.nom = "Ma liste de cours"
                
        return NavigationView {
            AfficherUneListeView(selectedListe: liste)
                .environment(\.managedObjectContext, context)
        }
    }
}
