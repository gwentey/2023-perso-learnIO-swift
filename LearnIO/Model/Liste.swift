import Foundation

struct Liste: Identifiable {
    
    var id = UUID()
    var nom: String
    var cartes: [Carte]
    
}
