import Foundation

struct List: Identifiable {
    
    var id = UUID()
    var nom: String
    var cartes: [Carte]
    
}
