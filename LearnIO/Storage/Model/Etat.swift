//
//  Etat.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 25/04/2023.
//

import Foundation



struct EtatInfo {
    var points: Int
}

enum Etat {
    case Echec
    case Difficile
    case Bon
    case Facile
}


let etatInfos: [Etat: EtatInfo] = [
    .Echec: EtatInfo(points: -6),
    .Difficile: EtatInfo(points: -3),
    .Bon: EtatInfo(points: 2),
    .Facile: EtatInfo(points: 3),
]



