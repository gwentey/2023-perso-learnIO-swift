//
//  AfficherListeView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import SwiftUI
import Charts

struct AfficherUneListeView: View {
    
    struct AfficherUneListeDataGrapheChartBar: Identifiable {
        var id = UUID()
        var type: String
        var nombre: Double
        var couleur: String
    }
    
    var data: [AfficherUneListeDataGrapheChartBar] {
        let cartesParNiveau = selectedListe.compterCartesParNiveau()
        return Niveau.allCases.reversed().map { niveau in
            let nombre = Double(cartesParNiveau[niveau, default: 0])
            let couleur: String
            switch niveau {
            case .A: couleur = "red"
            case .B: couleur = "green"
            case .C: couleur = "blue"
            case .D: couleur = "orange"
            case .E: couleur = "purple"
            case .F: couleur = "pink"
            case .G: couleur = "yellow"
            }
            return AfficherUneListeDataGrapheChartBar(type: "\(niveau)", nombre: nombre, couleur: couleur)
        }
    }
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var contientCartesAReviser: Bool {
        selectedListe.nombreCartesAReviser() > 0
    }
        
    @ObservedObject var selectedListe: Liste
    
    @FetchRequest var cartes: FetchedResults<Carte>
    
    init(selectedListe: Liste) {
        
        self.selectedListe = selectedListe
        self._cartes = FetchRequest(entity: Carte.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Carte.avant, ascending: true)], predicate: NSPredicate(format: "liste == %@", selectedListe))
    }
    
    var body: some View {

        Chart {
            ForEach(data) { shape in
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
            }
            .onAppear{
                viewContext.refreshAllObjects()
            }
        }
        .navigationBarItems(trailing: HStack {
            
            NavigationLink(destination: CreerUneCarteView(liste: selectedListe)
                .environment(\.managedObjectContext, viewContext)
            ) {
                Image(systemName: "plus")
            }
            NavigationLink(destination: SentrainerView(liste: selectedListe)
                .environment(\.managedObjectContext, viewContext)
            ) {
                Image(systemName: "play")
            }
            .disabled(!contientCartesAReviser)
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
