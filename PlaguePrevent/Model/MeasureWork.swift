//
//  MeasureWork.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension MeasureTypeWork {

    func popUp() -> PopupDialog {
        
        let work = MeasureTypeWork.asUsual
        let popup = PopupDialog(title: work.shortTitle(), message: work.infoText(), image: work.largeLogo())

        let buttonOne = CancelButton(title: MeasureTypeWork.asUsual.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureTypeWork.homeOfficeWherePossible.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureTypeWork.homeOfficeEverywhere.longDescription()) {

        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    
}
