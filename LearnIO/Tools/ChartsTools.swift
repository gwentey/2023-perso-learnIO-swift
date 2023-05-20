//
//  ChartsTools.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 20/05/2023.
//

import Foundation

struct AfficherUneListeDataGrapheChartBar: Identifiable {
    var id = UUID()
    var type: String
    var nombre: Double
    var couleur: String
}

public struct ChartsTools {

    
     static func GenenerateDataAfficherUneListeDataGrapheChartBar(liste: Liste) -> [AfficherUneListeDataGrapheChartBar] {
        let cartesParNiveau = liste.compterCartesParNiveau()
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
    
}
