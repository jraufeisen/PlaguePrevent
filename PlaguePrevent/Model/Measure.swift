//
//  Measure.swift
//  PlaguePrevent
//
//  Created by Johannes on 20.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

protocol ChangeMeasuresDelegate {
    func didChangeEffectiveness(state: MeasureEffectiveness)
    func didChangeBorder(state: MeasureTypeBorder)
    func didChangeSchools(state: MeasureTypeSchools)
    func didChangeTraffic(state: MeasureTypeTraffic)
    func didChangeWork(state: MeasureTypeWork)
    func didChangeAusgangssperre(state: MeasureTypeAusgangssperre)
    func didChangeBusinesses(state: MeasureTypeBusinesses)
    func didChangeCommunication(state: MeasureTypeCommunication)
    func didChangeScience(state: ScienceMeasure)
    func didChangeHealth(state: HealthServicesMeasure)
    func didChangeEconomics(state: EconomicHelpMeasure)
}


protocol MeasureDescription {
    func shortTitle() -> String
    func longDescription() -> String
    func titleImage() -> UIImage
    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog
    func smallLogo() -> UIImage
    func largeLogo() -> UIImage
    func infoText() -> String
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
    func infoText() -> String {
        return "Mit diesem Regler veränderst du die Stärke deiner Maßnahmen. Bedenke,dass Maßnahmen angemessen sein müssen, da Sie sonst die Moral negativ beeinflussen können"
    }
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Maßnahmenintensität-Small")
    }
    func largeLogo() -> UIImage {
        return #imageLiteral(resourceName: "Maßnahmenintensität")
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Grenzpolitik-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Grenzpolitik")
    }
    func infoText() -> String {
        return "Mit diesem Regler definierst du, wer deine Grenzen passieren darf. Bedenke, dass striktere Maßnahmen zu starken Staus und Warenengpässen führen können"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Öffentliche Einrichtungen-Small")
    }
    func largeLogo() -> UIImage {
       return #imageLiteral(resourceName: "Öffentliche Einrichtungen.jpg")
    }
    func infoText() -> String {
        return "Öffentliche Einrichtungen sind Orte großer Versammlungen und somit leichte Infektionsmultiplikatoren"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Reisebeschränkungen-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Reisebeschränkungen.jpg")
    }
    func infoText() -> String {
        return "Diese Maßnahme schränkt, je nach stärke, die Bewegungsfreiheit deiner Bürger ein und hilft dabei eine Ausbreitung zu verlangsamen"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Arbeit-Small")
    }
    func largeLogo() -> UIImage {
       return #imageLiteral(resourceName: "Arbeit.jpg")
    }
    func infoText() -> String {
        return "Arbeitsplätze sind Orte großer Versammlungen und somit leichte Infektionsmultiplikatoren"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Ausgangssperre-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Ausgangssperre.jpg")
    }
    func infoText() -> String {
        return "Ausgangssperren minimieren soziale Kontakte und somit das Risiko der Übertragung des Virus"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Öffentliche Versorgung-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Öffentliche Versorgung.jpg")
    }
    func infoText() -> String {
        return "Die öffentliche Versorgung schließt alle Betriebe des alltäglichen Lebens ein. Von Kleidungen bis zu Krankenhäusern. Diese können bis auf die Grundversorgung heruntergefahren werden"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Kommunikation-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Kommunikation.jpg")
    }
    func infoText() -> String {
        return "Die kommunikation entscheidet wie viele Informationen du freigibst und wie ehrlich du zur Bevölkerung bist"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Forschungsgelder-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Forschungsgelder.jpg")
    }
    func infoText() -> String {
        return "Je höher die Forschungsgelder desto intensiver wird geforscht. Beachte, dass dir die Mittel auch ausgehen können"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Gesundheitsbudget-Small")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Gesundheitsbudget.jpg")
    }
    func infoText() -> String {
        return "Durch das Gesundheitsbudget werden Dinge wie Krankenhäuser und andere medizinische Einrichtungen beeinflusst. Beachte, dass dir die Mittel auch ausgehen können"
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
    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "Wirtschaftshilfen")
    }
    func largeLogo() -> UIImage {
       return  #imageLiteral(resourceName: "Wirtschaftshilfe.jpg")
    }
    func infoText() -> String {
        return "Unternehmen leiden unter einer eingeschränkten Gesellschaft, somit können unter anderem arbeitsplätze verloren gehen. Wirtschaftshilfen arbeiten dagegen an. Beachte, dass dir die Mittel auch ausgehen können"
    }
}
