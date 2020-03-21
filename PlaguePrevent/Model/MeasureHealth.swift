//
//  MeasureHealth.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension HealthServicesMeasure {

    func popUp() -> PopupDialog {
        
        let health = HealthServicesMeasure.init(money: 0)
        let popup = PopupDialog(title: health.shortTitle(), message: health.infoText(), image: health.largeLogo())

        // TODO: Enter number here
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
