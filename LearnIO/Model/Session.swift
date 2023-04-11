import Foundation

enum Etat {
    case Echec
    case Difficile
    case Bon
    case Facile
}

struct Session: Identifiable {
    var id = UUID()
    var date = Date()
    var etat: Etat
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }()
    
    var formattedDate: String {
        Session.dateFormatter.string(from: date)
    }
    
    
}
