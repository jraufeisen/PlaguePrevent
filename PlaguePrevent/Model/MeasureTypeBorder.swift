//
//  MeasureTypeBorder.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

// MARK: - PopUp Provider

extension MeasureTypeBorder {
    func popUp() -> PopupDialog {
        let popup = PopupDialog(title: MeasureTypeBorder.open.shortTitle(), message: MeasureTypeBorder.open.infoText(), image: MeasureTypeBorder.open.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeBorder.open.longDescription()) {

        }
        let buttonTwo = CancelButton(title: MeasureTypeBorder.goodsOnly.longDescription()) {

        }
        let buttonThree = CancelButton(title: MeasureTypeBorder.closed.longDescription()) {

        }

        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
