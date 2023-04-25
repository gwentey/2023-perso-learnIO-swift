//
//  Niveau.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 25/04/2023.
//

import Foundation

struct NiveauInfo {
    var nbJour: Int
}

enum Niveau {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
}

let niveauInfos: [Niveau: NiveauInfo] = [
    .A: NiveauInfo(nbJour: 1),
    .B: NiveauInfo(nbJour: 3),
    .C: NiveauInfo(nbJour: 6),
    .D: NiveauInfo(nbJour: 10),
    .E: NiveauInfo(nbJour: 20),
    .F: NiveauInfo(nbJour: 40),
    .G: NiveauInfo(nbJour: 80)
]
