//
//  Liste.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import Foundation

struct Liste: Identifiable {
    
    var id = UUID()
    var nom: String
    var cartes: [Carte]
    
}
