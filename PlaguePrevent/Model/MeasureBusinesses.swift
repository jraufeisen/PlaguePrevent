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
        let buttonOne = SelectionButton(title: MeasureTypeBusinesses.businessAsUsual.longDescription()) {
            delegate.didChangeBusinesses(state: .businessAsUsual)            
        }
        
        let buttonTwo = SelectionButton(title: MeasureTypeBusinesses.restrictedClosingHours.longDescription()) {
            delegate.didChangeBusinesses(state: .restrictedClosingHours)
            buttonOne.isSelected = false
        }
        let buttonThree = SelectionButton(title: MeasureTypeBusinesses.supermarketOnly.longDescription()) {
            delegate.didChangeBusinesses(state: .supermarketOnly)
        }
        
        switch self {
        case .businessAsUsual: buttonOne.titleColor = .systemBlue
        case .restrictedClosingHours: buttonTwo.titleColor = .systemBlue
        case .supermarketOnly: buttonThree.titleColor = .systemBlue
        }
        
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
