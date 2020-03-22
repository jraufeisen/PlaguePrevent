//
//  BorderPopup.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeCommunication {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        let popup = PopupDialog(title: MeasureTypeCommunication.fullTransparency.shortTitle(), message: MeasureTypeCommunication.fullTransparency.infoText(), image: MeasureTypeCommunication.fullTransparency.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeCommunication.fullTransparency.longDescription()) {
            delegate.didChangeCommunication(state: .fullTransparency)
        }
        let buttonTwo = CancelButton(title: MeasureTypeCommunication.euphemistic.longDescription()) {
            delegate.didChangeCommunication(state: .euphemistic)

        }
        let buttonThree = CancelButton(title: MeasureTypeCommunication.calmingTransparency.longDescription()) {
            delegate.didChangeCommunication(state: .calmingTransparency)
        }
        let buttonFour = CancelButton(title: MeasureTypeCommunication.sayNothing.longDescription()) {
            delegate.didChangeCommunication(state: .sayNothing)
        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour])
        popup.transitionStyle = .bounceUp
        
        switch self {
        case .fullTransparency: buttonOne.titleColor = .systemBlue
        case .euphemistic: buttonTwo.titleColor = .systemBlue
        case .calmingTransparency: buttonThree.titleColor = .systemBlue
        case .sayNothing: buttonFour.titleColor = .systemBlue
        }

        
        return popup
    }

    
}
