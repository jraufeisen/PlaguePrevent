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
    var longDistanceTraffic: MeasureTypeLongDistanceTraffic = .open
    var shortDistanceTraffic: MeasureTypeShortDistanceTraffic = .open
    var work: MeasureTypeWork = .asUsual
    var ausgangssperre: MeasureTypeAusgangssperre = .inactive
    var business: MeasureTypeBusinesses = .businessAsUsual
    var communication: MeasureTypeCommunication = .sayNothing
    var science = ScienceMeasure.init(money: 0)
    var health = HealthServicesMeasure.init(money: 0)
    var economicHelps = EconomicHelpMeasure.init(money: 0)
    
    func allMeasures() -> [MeasureDescription] {
        return [
            enforcement, border, school, longDistanceTraffic, shortDistanceTraffic, work, ausgangssperre, business, communication, science, health, economicHelps
        ]
    }
    
}
