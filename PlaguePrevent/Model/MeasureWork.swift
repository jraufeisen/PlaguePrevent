//
//  MeasureWork.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeWork {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        
        let work = MeasureTypeWork.asUsual
        let popup = PopupDialog(title: work.shortTitle(), message: work.infoText(), image: work.largeLogo())

        let buttonOne = CancelButton(title: MeasureTypeWork.asUsual.longDescription()) {
            delegate.didChangeWork(state: .asUsual)
        }
        let buttonTwo = CancelButton(title: MeasureTypeWork.homeOfficeWherePossible.longDescription()) {
            delegate.didChangeWork(state: .homeOfficeWherePossible)
        }
        let buttonThree = CancelButton(title: MeasureTypeWork.homeOfficeEverywhere.longDescription()) {
            delegate.didChangeWork(state: .homeOfficeEverywhere)
        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        switch self {
        case .asUsual: buttonOne.titleColor = .systemBlue
        case .homeOfficeWherePossible: buttonTwo.titleColor = .systemBlue
        case .homeOfficeEverywhere: buttonThree.titleColor = .systemBlue
        }

        
        return popup
    }

    
}
