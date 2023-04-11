//
//  Carte.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 10/04/2023.
//

import Foundation

struct Carte: Identifiable {
    
    var id = UUID()
    var devant: String
    var derriere: String
    var session: [Session]
    
}
