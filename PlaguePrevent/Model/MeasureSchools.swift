//
//  MeasureSchools.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeSchools {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        let popup = PopupDialog(title: MeasureTypeSchools.open.shortTitle(), message: MeasureTypeSchools.open.infoText(), image: MeasureTypeSchools.open.largeLogo())
        let buttonOne = SelectionButton(title: MeasureTypeSchools.closed.longDescription()) {
            delegate.didChangeSchools(state: .closed)
        }
        let buttonTwo = SelectionButton(title: MeasureTypeSchools.open.longDescription()) {
            delegate.didChangeSchools(state: .open)
        }

        popup.addButtons([buttonOne, buttonTwo])
        popup.transitionStyle = .bounceUp
        
        switch self {
        case .open: buttonOne.titleColor = .systemBlue
        case .closed: buttonTwo.titleColor = .systemBlue
        }

        
        return popup
    }

    
}
