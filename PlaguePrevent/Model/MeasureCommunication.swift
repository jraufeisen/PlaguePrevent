//
//  BorderPopup.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeCommunication {

    func popUp() -> PopupDialog {
        let popup = PopupDialog(title: MeasureTypeCommunication.fullTransparency.shortTitle(), message: MeasureTypeCommunication.fullTransparency.infoText(), image: MeasureTypeCommunication.fullTransparency.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeCommunication.fullTransparency.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureTypeCommunication.euphemistic.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureTypeCommunication.calmingTransparency.longDescription()) {

        }
        let buttonFour = CancelButton(title: MeasureTypeCommunication.sayNothing.longDescription()) {

        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
