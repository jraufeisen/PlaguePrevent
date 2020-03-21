//
//  MeasureAusgangssperre.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation


extension MeasureTypeAusgangssperre {

    
    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        
        let sperre = MeasureTypeAusgangssperre.inactive
        let popup = PopupDialog(title: sperre.shortTitle(), message: sperre.infoText(), image: sperre.largeLogo())

        let buttonOne = CancelButton(title: MeasureTypeAusgangssperre.active.longDescription()) {
            delegate.didChangeAusgangssperre(state: .active)
        }
        let buttonTwo = CancelButton(title: MeasureTypeAusgangssperre.inactive.longDescription()) {
            delegate.didChangeAusgangssperre(state: .inactive)
        }

        popup.addButtons([buttonOne, buttonTwo])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
