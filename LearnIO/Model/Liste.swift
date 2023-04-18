import Foundation

struct Liste: Identifiable  {
    
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
    
    func prochaineRevisionDansMoinsDe(_ jours: Int) -> Int? {
        let maintenant = Date()
        var prochaineRevisionDansMoinsDeJours: Int? = nil
        
        for carte in cartes {
            let tempsDeRetard = carte.dateProchaineRevision.timeIntervalSince(maintenant)
            let joursDeRetard = Int(ceil(tempsDeRetard / (60 * 60 * 24))) // Convertit les secondes en jours en arrondissant à l'entier supérieur
            
            if joursDeRetard <= jours {
                if prochaineRevisionDansMoinsDeJours == nil || joursDeRetard < prochaineRevisionDansMoinsDeJours! {
                    prochaineRevisionDansMoinsDeJours = joursDeRetard
                }
            }
        }
        
        return prochaineRevisionDansMoinsDeJours
    }

    
}
