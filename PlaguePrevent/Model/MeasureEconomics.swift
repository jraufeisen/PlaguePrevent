//
//  MeasureEconomics.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension EconomicHelpMeasure {

    func popUp() -> PopupDialog {
        
        let economics = EconomicHelpMeasure.init(money: 0)
        let popup = PopupDialog(title: economics.shortTitle(), message: economics.infoText(), image: economics.largeLogo())

        // TODO: Enter number here
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
