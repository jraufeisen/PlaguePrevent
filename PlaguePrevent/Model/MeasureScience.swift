//
//  MeasureScience.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension ScienceMeasure {

    func popUp() -> PopupDialog {
        
        let science = ScienceMeasure.init(money: 0)
        let popup = PopupDialog(title: science.shortTitle(), message: science.infoText(), image: science.largeLogo())

        // TODO: Enter number here
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
