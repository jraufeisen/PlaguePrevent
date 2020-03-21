//
//  MeasureTypeBusinesses.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

// MARK: - PopUp Provider

extension MeasureTypeBusinesses {
    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        
        let popup = PopupDialog(title: MeasureTypeBusinesses.businessAsUsual.shortTitle(), message: MeasureTypeBusinesses.businessAsUsual.infoText(), image: MeasureTypeBusinesses.businessAsUsual.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeBusinesses.businessAsUsual.longDescription()) {
            delegate.didChangeBusinesses(state: .businessAsUsual)
        }
        let buttonTwo = CancelButton(title: MeasureTypeBusinesses.restrictedClosingHours.longDescription()) {
            delegate.didChangeBusinesses(state: .restrictedClosingHours)
        }
        let buttonThree = CancelButton(title: MeasureTypeBusinesses.supermarketOnly.longDescription()) {
            delegate.didChangeBusinesses(state: .supermarketOnly)
        }
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
