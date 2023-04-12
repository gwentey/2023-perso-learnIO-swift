import Foundation

struct Liste: Identifiable {
    
    var id = UUID()
    var nom: String
    var cartes: [Carte]

    
    
    func compterCartes() -> Int {
        return cartes.count
    }
    
    func cartesAReviser() -> [Carte] {
        let maintenant = Date()
        return cartes.filter { carte in
            if carte.score <= 3 {
                return true
            } else {
                let tempsDeRetard = carte.dateProchaineRevision.timeIntervalSince(maintenant)
                return tempsDeRetard <= 0
            }
        }
    }
    
}
