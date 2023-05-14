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

enum Niveau : CaseIterable{
    case A
    case B
    case C
    case D
    case E
    case F
    case G
}

let niveauInfos: [Niveau: NiveauInfo] = [
    .A: NiveauInfo(nbJour: 80),
    .B: NiveauInfo(nbJour: 40),
    .C: NiveauInfo(nbJour: 20),
    .D: NiveauInfo(nbJour: 10),
    .E: NiveauInfo(nbJour: 6),
    .F: NiveauInfo(nbJour: 3),
    .G: NiveauInfo(nbJour: 1)
]
