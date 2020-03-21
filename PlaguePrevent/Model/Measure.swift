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
}

enum MeasureTypeBorder : MeasureDescription {
    case closed
    case goodsOnly
    case noTourists
    case open
}

enum MeasureTypeSchools : MeasureDescription{
    case open
    case closed
}

enum MeasureTypeLongDistanceTraffic : MeasureDescription{
    case open
    case goodsOnly
}

enum MeasureTypeShortDistanceTraffic : MeasureDescription{
    case open
    case goodsOnly
}

enum MeasureTypeWork : MeasureDescription{
    case homeOfficeEverywhere
    case homeOfficeWherePossible
    case asUsual
}

enum MeasureTypeAusgangssperre : MeasureDescription{
    case active
    case inactive
}

enum MeasureTypeBusinesses : MeasureDescription{
    case supermarketOnly // krass
    case restrictedClosingHours // mittel
    case businessAsUsual // nicht krass
}

enum MeasureTypeCommunication : MeasureDescription{
    case sayNothing
    case euphemistic
    case calmingTransparency
    case fullTransparency
}

// Abstract superclass
class Measure: NSObject, MeasureDescription {

}

// Invest X money in science
class ScienceMeasure: Measure {
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    
}

// Invest X money in health services
class HealthServicesMeasure: Measure {
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    
}

// Invest X money in Wirtschaftshilfe
class EconomicHelpMeasure: Measure {
    
    let money: Int
    init(money: Int) {
        self.money = money
    }
    
}
