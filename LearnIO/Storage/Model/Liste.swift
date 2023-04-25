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
    
    func prochaineRevisionDansMoinsDe(_ jours: Int) -> Int? {
        let maintenant = Date()
        var prochaineRevisionDansMoinsDeJours: Int? = 0
        
        if let cartes = cartes {
            for carte in cartes {
                if let carte = carte as? Carte { // Vérifie que la carte est bien une instance de la classe Carte
                    let tempsDeRetard = carte.dateProchaineRevision.timeIntervalSince(maintenant)
                    let joursDeRetard = Int(ceil(tempsDeRetard / (60 * 60 * 24))) // Convertit les secondes en jours en arrondissant à l'entier supérieur
                    
                    if joursDeRetard <= jours {
                        if prochaineRevisionDansMoinsDeJours == 0 || joursDeRetard < prochaineRevisionDansMoinsDeJours! {
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
            $0 is Carte && ($0 as! Carte).dateProchaineRevision <= maintenant
        } as? [Carte] ?? []
    }

    
}
