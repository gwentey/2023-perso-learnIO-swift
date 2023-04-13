import Foundation

enum Niveau {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
}

struct Carte: Identifiable {
    
    var id = UUID()
    var devant: String
    var derriere: String
    var session: [Session] = []
    var dateDernierMalus = Date()
    var niveau: Niveau {
        get {
            switch score {
                case 0...5:
                    return .G
                case 6...12:
                    return .F
                case 12...18:
                    return .E
                case 18...24:
                    return .D
                case 24...30:
                    return .C
                case 30...36:
                    return .B
                case 37...42:
                    return .A
                default:
                    return .A // Si le score est supérieur à 42, le niveau est A par défaut
            }
        }
        set {
            // Ne fait rien, car on ne veut pas que la valeur de niveau soit modifiée directement
        }
    }

    private var _score: Int = 0

    var score: Int {
        get {
            return _score
        }
        set {
            if newValue < 0 {
                _score = 0
            } else {
                _score = newValue
            }
        }
    }
    
    private var _dateProchaineRevision: Date
    
    var dateProchaineRevision: Date {
        get {
            return _dateProchaineRevision
        }
        set {
            _dateProchaineRevision = newValue
        }
    }
        
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }()
    
    
    var formattedDate: String {
        Carte.dateFormatter.string(from: dateProchaineRevision)
    }
    
    var formattedDernierMalus: String {
        Carte.dateFormatter.string(from: dateDernierMalus)
    }
    
    init(devant: String, derriere: String, dateProchaineRevision: Date) {
        self.devant = devant
        self.derriere = derriere
        self.dateDernierMalus = Date()
        self._dateProchaineRevision = dateProchaineRevision

        self.score = 0
    }
    
}


extension Carte {
    
    // Temps de retard
    var tempsDeRetard: TimeInterval {
        let temps = dateProchaineRevision.timeIntervalSince(Date())
        return max(0, temps)
    }
    
    // Temps entre dernier malus et aujourd'hui
    var tempsEntreDernierMalusEtAujourdhui: TimeInterval {
        let temps = Date().timeIntervalSince(dateDernierMalus)
        return temps
    }
    
    // Recalculer le score d'une carte
    mutating func recalculerScore() {
        let tempsDeRetard = self.tempsDeRetard
        if tempsDeRetard == 0 {
            return
        }
        if tempsDeRetard < 0 {
            let tempsEntreDernierMalusEtAujourdhui = self.tempsEntreDernierMalusEtAujourdhui
            if tempsEntreDernierMalusEtAujourdhui < 0 {
                let pointsASuspendre = Int(abs(tempsEntreDernierMalusEtAujourdhui) / 86400) // 1 jour = 86400 secondes
                score = max(0, score - pointsASuspendre)
            }
        }
    }
    
    // Vérifier si la carte doit être révisée
    func doitEtreRevisee() -> Bool {
        return tempsDeRetard <= 0 || score <= 3
    }
}


