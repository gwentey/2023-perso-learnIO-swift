import Foundation

class Tools {
    static func frequenceRevisionPourNiveau(_ niveau: Niveau) -> Int {
        switch niveau {
        case .A:
            return 7
        case .B:
            return 6
        case .C:
            return 5
        case .D:
            return 4
        case .E:
            return 3
        case .F:
            return 2
        case .G:
            return 1
        }
    }
    
    // let niveau = Niveau.B
    // let frequence = Tools.frequenceRevisionPourNiveau(niveau)
    // print(frequence) // Affichera "6"

}
