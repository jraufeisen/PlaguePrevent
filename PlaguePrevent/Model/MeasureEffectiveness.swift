//
//  BorderPopup.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureEffectiveness {

    func popUp() -> PopupDialog {
        let popup = PopupDialog(title: MeasureEffectiveness.voluntarily.shortTitle(), message: MeasureEffectiveness.voluntarily.infoText(), image: MeasureEffectiveness.voluntarily.largeLogo())
        let buttonOne = CancelButton(title: MeasureEffectiveness.voluntarily.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureEffectiveness.enforcedByPolice.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureEffectiveness.enforcedByMilitary.longDescription()) {

        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
