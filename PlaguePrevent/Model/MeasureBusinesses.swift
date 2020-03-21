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
        // Create the dialog
        let popup = PopupDialog(title: MeasureTypeBusinesses.businessAsUsual.shortTitle(), message: "Mit diesem Regler veränderst du die Stärke deiner Maßnahmen. Bedenke,dass Maßnahmen angemessen sein müssen, da Sie sonst die Moral negativ beeinflussen können.", image: #imageLiteral(resourceName: "nyc.jpg") , preferredWidth: 100)

        // Create buttons
        let buttonOne = CancelButton(title: MeasureTypeBusinesses.businessAsUsual.longDescription()) {

        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {

        }

        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {

        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

}
