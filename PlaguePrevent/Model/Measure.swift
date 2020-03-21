//
//  Measure.swift
//  PlaguePrevent
//
//  Created by Johannes on 20.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

protocol MeasureDescription {
    func shortTitle() -> String
    func longDescription() -> String
    func titleImage() -> UIImage
    func popUp() -> PopupDialog
}

// Global setting, slider
enum MeasureEffectiveness : MeasureDescription {
    case enforcedByMilitary
    case enforcedByPolice
    case voluntarily    // Appell an die Bevölkerung
    
    func shortTitle() -> String {
        return "Maßnahmen-Intensität"
    }
    func longDescription() -> String {
        switch self {
        case .enforcedByPolice:
            return "Durchsetzung durch Polizei"
        case .enforcedByMilitary:
            return "Durchsetzung durch Militär"
        case .voluntarily:
            return "Freiwilligkeit"
        }
    }
}

enum MeasureTypeBorder : MeasureDescription {
    case closed
    case goodsOnly
    case noTourists
    case open
    func shortTitle() -> String {
        return "Grenzpolitik"
    }
    func longDescription() -> String {
        switch self {
        case .closed: return "Grenze geschlossen"
        case .goodsOnly: return "Nur Warenverkehr"
        case .noTourists: return "Nur Waren- und Berufsverkehr. Keine Touristen"
        case .open: return "Komplett offen"
        }
    }
}

enum MeasureTypeSchools : MeasureDescription{
    case open
    case closed
    
    func shortTitle() -> String {
        return "Öffentliche Einrichtungen"
    }
    func longDescription() -> String {
        switch self {
        case .open: return "Geöffnet"
        case .closed: return "Geschlossen"
        }
    }
}

enum MeasureTypeTraffic : MeasureDescription{
    case regionalOnly
    case restrictedLongDistance
    case noFlights
    case noRestriction

    func shortTitle() -> String {
        return "Personenverkehr"
    }
    
    func longDescription() -> String {
        switch self {
        case .regionalOnly: return "Nur regionaler Verkehr"
        case .restrictedLongDistance: return "Eingeschränkter Fernverkehr"
        case .noFlights: return "Keine Flüge"
        case .noRestriction: return "Keine Einschränkungen"
        }
    }
}

enum MeasureTypeWork : MeasureDescription{
    case homeOfficeEverywhere
    case homeOfficeWherePossible
    case asUsual
    func shortTitle() -> String {
        return "Arbeit"
    }
    func longDescription() -> String {
        switch self {
        case .homeOfficeEverywhere: return "Nur Systemrelevante Berufe"
        case .homeOfficeWherePossible: return "HomeOffice wenn möglich"
        case .asUsual: return "Normalbetrieb"
        }
    }
}

enum MeasureTypeAusgangssperre : MeasureDescription{
    case active
    case sperrstunden
    case inactive
    func shortTitle() -> String {
        return "Ausgangssperre"
    }
    func longDescription() -> String {
        switch self {
        case .active: return "Ausgangssperre"
        case .inactive: return "Freie Bewegung"
        case .sperrstunden: return "Einige Sperrstunden"
        }
    }
}

enum MeasureTypeBusinesses : MeasureDescription{
    case supermarketOnly // krass
    case restrictedClosingHours // mittel
    case businessAsUsual // nicht krass
    func shortTitle() -> String {
        return "Öffentliche Versorgung"
    }
    func longDescription() -> String {
        switch self {
        case .supermarketOnly: return "Nur Lebensnotwendiges"
        case .restrictedClosingHours: return "Verkürzte Öffnungszeiten"
        case .businessAsUsual: return "Normalbetrieb"
        }
    }
}

enum MeasureTypeCommunication : MeasureDescription{
    case sayNothing
    case euphemistic
    case calmingTransparency
    case fullTransparency

    func shortTitle() -> String {
        return "Kommunikation"
    }
    func longDescription() -> String {
        switch self {
        case .sayNothing: return "Keine Transparenz"
        case .euphemistic: return "Sich zuversichtlich zeigen"
        case .calmingTransparency: return "Bevölkerung beruhigen"
        case .fullTransparency: return "Volle Transparenz"
        }
    }
}

// Abstract superclass
class Measure: NSObject {

}

// Invest X money in science
class ScienceMeasure: Measure, MeasureDescription{
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    func shortTitle() -> String {
        return "Forschung"
    }
    func longDescription() -> String {
        return "\(money)€ in Forschung investieren"
    }
}

// Invest X money in health services
class HealthServicesMeasure: Measure, MeasureDescription {
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    func shortTitle() -> String {
        return "Gesundheitssystem"
    }
    func longDescription() -> String {
        return "\(money)€ in das Gesundheitssystem investieren"
    }

}

// Invest X money in Wirtschaftshilfe
class EconomicHelpMeasure: Measure, MeasureDescription {
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    func shortTitle() -> String {
        return "Wirtschaftshilfe"
    }
    func longDescription() -> String {
        return "\(money)€ in wirtschaftliche Hilfe investieren"
    }

}
