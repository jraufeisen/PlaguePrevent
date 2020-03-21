//
//  MeasureTraffic.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeTraffic {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        
        let traffic = MeasureTypeTraffic.regionalOnly
        let popup = PopupDialog(title: traffic.shortTitle(), message: traffic.infoText(), image: traffic.largeLogo())

        let buttonOne = CancelButton(title: MeasureTypeTraffic.noRestriction.longDescription()) {
            delegate.didChangeTraffic(state: .noRestriction)
        }
        let buttonTwo = CancelButton(title: MeasureTypeTraffic.noFlights.longDescription()) {
            delegate.didChangeTraffic(state: .noFlights)
        }
        let buttonThree = CancelButton(title: MeasureTypeTraffic.restrictedLongDistance.longDescription()) {
            delegate.didChangeTraffic(state: .restrictedLongDistance)
        }
        let buttonFour = CancelButton(title: MeasureTypeTraffic.regionalOnly.longDescription()) {
            delegate.didChangeTraffic(state: .regionalOnly)
        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
