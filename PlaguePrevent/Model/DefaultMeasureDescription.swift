//
//  DefaultMeasureDescription.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation
import UIKit

extension MeasureDescription {
    func shortTitle() -> String {
        return "Measure A"
    }
    func longDescription() -> String {
        return "Long description for each case"
    }
    func titleImage() -> UIImage {
        return #imageLiteral(resourceName: "Bag")
    }
    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        // Create the dialog
        let popup = PopupDialog(title: "Border", message: "Change your border policy", image: #imageLiteral(resourceName: "nyc.jpg") , preferredWidth: 100)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "ADMIRE CAR", dismissOnTap: false) {
            print("What a beauty!")
        }

        let buttonThree = DefaultButton(title: "BUY CAR", height: 60) {
            print("Ah, maybe next time :)")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        popup.transitionStyle = .bounceUp
        
        return popup
    }

    func smallLogo() -> UIImage {
        return #imageLiteral(resourceName: "poop.png")
    }
    
    func largeLogo() -> UIImage {
        return #imageLiteral(resourceName: "poop.png")
    }
    func infoText() -> String {
        return "Change your policy"
    }
}
