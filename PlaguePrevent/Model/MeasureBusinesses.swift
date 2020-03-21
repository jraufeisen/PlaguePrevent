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
    func popUp() -> PopupDialog {
        
        let popup = PopupDialog(title: MeasureTypeBusinesses.businessAsUsual.shortTitle(), message: MeasureTypeBusinesses.businessAsUsual.infoText(), image: MeasureTypeBusinesses.businessAsUsual.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeBusinesses.businessAsUsual.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureTypeBusinesses.restrictedClosingHours.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureTypeBusinesses.supermarketOnly.longDescription()) {

        }
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
