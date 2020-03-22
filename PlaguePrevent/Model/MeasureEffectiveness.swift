//
//  BorderPopup.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureEffectiveness {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        let popup = PopupDialog(title: MeasureEffectiveness.voluntarily.shortTitle(), message: MeasureEffectiveness.voluntarily.infoText(), image: MeasureEffectiveness.voluntarily.largeLogo())
        let buttonOne = SelectionButton(title: MeasureEffectiveness.voluntarily.longDescription()) {
            delegate.didChangeEffectiveness(state: .voluntarily)
        }
        let buttonTwo = SelectionButton(title: MeasureEffectiveness.enforcedByPolice.longDescription()) {
            delegate.didChangeEffectiveness(state: .enforcedByPolice)
        }
        let buttonThree = SelectionButton(title: MeasureEffectiveness.enforcedByMilitary.longDescription()) {
            delegate.didChangeEffectiveness(state: .enforcedByMilitary)
        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        switch self {
        case .voluntarily: buttonOne.titleColor = .systemBlue
        case .enforcedByPolice: buttonTwo.titleColor = .systemBlue
        case .enforcedByMilitary: buttonThree.titleColor = .systemBlue
        }

        
        return popup
    }

    
}
