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
    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        let popup = PopupDialog(title: MeasureTypeBorder.open.shortTitle(), message: MeasureTypeBorder.open.infoText(), image: MeasureTypeBorder.open.largeLogo())
        let buttonOne = CancelButton(title: MeasureTypeBorder.open.longDescription()) {
            delegate.didChangeBorder(state: .open)
        }
        let buttonTwo = CancelButton(title: MeasureTypeBorder.noTourists.longDescription()) {
            delegate.didChangeBorder(state: .noTourists)
        }
        let buttonThree = CancelButton(title: MeasureTypeBorder.goodsOnly.longDescription()) {
            delegate.didChangeBorder(state: .goodsOnly)
        }
        let buttonFour = CancelButton(title: MeasureTypeBorder.closed.longDescription()) {
            delegate.didChangeBorder(state: .closed)
        }

        switch self {
        case .open: buttonOne.titleColor = .systemBlue
        case .noTourists: buttonTwo.titleColor = .systemBlue
        case .goodsOnly: buttonThree.titleColor = .systemBlue
        case .closed: buttonThree.titleColor = .systemBlue
        }
    
        popup.addButtons([buttonOne, buttonTwo, buttonThree, buttonFour])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
