//
//  MeasurePackage.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class MeasurePackage: NSObject {

    var enforcement: MeasureEffectiveness = .voluntarily
    var border: MeasureTypeBorder = .open
    var school: MeasureTypeSchools = .open
    var traffic: MeasureTypeTraffic = .noRestriction
    var work: MeasureTypeWork = .asUsual
    var ausgangssperre: MeasureTypeAusgangssperre = .inactive
    var business: MeasureTypeBusinesses = .businessAsUsual
    var communication: MeasureTypeCommunication = .sayNothing
    var science = ScienceMeasure.init(money: 0)
    var health = HealthServicesMeasure.init(money: 0)
    var economicHelps = EconomicHelpMeasure.init(money: 0)
    
    func allMeasures() -> [MeasureDescription] {
        return [
            enforcement, border, school, traffic, work, ausgangssperre, business, communication, science, health, economicHelps
        ]
    }
    
    private let randomMessages: [String] = [
        "Der Ärzteverbund ließ bekannt geben, dass es die ersten Todesfälle gibt, welche sich auf das neue Virus zurückführen lassen.",
        "Das neue Virus wurde auf eine Beobachtungsliste gesetzt. Experten warnen, dass es sich rasch ausbreiten könnte",
        "Erste Tests eines möglichen Impfstoffs wurde in die Testphase geschickt",
        "Toilettenpapier wird vielerorts knapp",
        "WHO erklärt Pandemiestatus",
        "WHO äußert sich besorgt zur aktuellen Lage des Virus",
        "Künstler weltweit rufen zu einer Spendaktion auf",
        "Aufgrund der Quarantäne ist das Internets vielerorts überlastet",
        "Psychologen warnen, dass Selbstmordrate durch Isolation steigen könnte"
    ]
    
    func randomTickerMessage() -> String {
        return randomMessages.randomElement() ?? "Heino singt und komponiert neue EU Hymne"
    }
    
}
