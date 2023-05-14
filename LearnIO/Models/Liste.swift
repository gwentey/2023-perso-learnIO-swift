//
//  Liste.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 23/04/2023.
//

import Foundation
import CoreData

class Liste: NSManagedObject {
    
    func compterCartes() -> Int {
        if let cartes = self.cartes {
            return cartes.count
        } else {
            return 0
        }
    }
    
    func compterCartesParNiveau() -> [Niveau: Int] {
        var cartesParNiveau: [Niveau: Int] = [:]
        
        if let cartes = cartes {
            for carte in cartes {
                if let carte = carte as? Carte { // Vérifie que la carte est bien une instance de la classe Carte
                    let niveau = carte.niveau
                    cartesParNiveau[niveau, default: 0] += 1
                }
            }
        }
        
        return cartesParNiveau
    }
    
    func prochaineRevisionDansMoinsDe(_ jours: Int) -> Int? {
        let maintenant = Date()
        var prochaineRevisionDansMoinsDeJours: Int? = nil
        
        if let cartes = cartes {
            for carte in cartes {
                if let carte = carte as? Carte { // Vérifie que la carte est bien une instance de la classe Carte
                    if carte.score <= 3 {
                        return 0
                    }
                    
                    let tempsDeRetard = carte.dateProchaineRevision.timeIntervalSince(maintenant)
                    let joursDeRetard = Int(ceil(tempsDeRetard / (60 * 60 * 24))) // Convertit les secondes en jours en arrondissant à l'entier supérieur
                    
                    if joursDeRetard <= jours {
                        if prochaineRevisionDansMoinsDeJours == nil || joursDeRetard < prochaineRevisionDansMoinsDeJours! {
                            prochaineRevisionDansMoinsDeJours = joursDeRetard
                        }
                    }
                    
                }
            }
        }
        
        return prochaineRevisionDansMoinsDeJours
    }

    
    func cartesAReviserAujourdhuiOuAvant() -> [Carte] {
        let maintenant = Date()
        
        return cartes?.filter {
            if let carte = $0 as? Carte {
                return carte.dateProchaineRevision <= maintenant || carte.score <= 3
            }
            return false
        } as? [Carte] ?? []
    }
    
    func nombreCartesAReviser() -> Int {
        let cartesAReviser = cartesAReviserAujourdhuiOuAvant()
        return cartesAReviser.count
    }

    
    
}
