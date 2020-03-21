//
//  MeasureTraffic.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeTraffic {

    func popUp() -> PopupDialog {
        
        let traffic = MeasureTypeTraffic.regionalOnly
        let popup = PopupDialog(title: traffic.shortTitle(), message: traffic.infoText(), image: traffic.largeLogo())

        let buttonOne = CancelButton(title: MeasureTypeTraffic.noRestriction.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureTypeTraffic.noFlights.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureTypeTraffic.restrictedLongDistance.longDescription()) {

        }
        let buttonFour = CancelButton(title: MeasureTypeTraffic.regionalOnly.longDescription()) {

        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
