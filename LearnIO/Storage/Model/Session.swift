import Foundation
import CoreData


class Session: NSManagedObject {
    
    var date = Date()
    var etat: Etat = .Echec
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }()
    
    var formattedDate: String {
        Session.dateFormatter.string(from: date)
    }
    
    
}
