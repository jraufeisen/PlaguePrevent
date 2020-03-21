//
//  MeasureHealth.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension HealthServicesMeasure {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        
        let science = HealthServicesMeasure.init(money: 0)

        let moneyVC = PopupMoneyViewController(nibName: "PopupMoneyViewController", bundle: .main)
        moneyVC.shortTitle = science.shortTitle()
        moneyVC.longDescription = science.longDescription()
        moneyVC.image = science.largeLogo()

        let popup = PopupDialog(viewController: moneyVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceUp,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        let buttonOne = CancelButton(title: "Cancel", height: 60) {

        }

        let buttonTwo = DefaultButton(title: "Save", height: 60) {
            let moneyString = moneyVC.textField.text ?? ""
            let enteredMoney = Int(moneyString) ?? 0
            delegate.didChangeHealth(state: HealthServicesMeasure.init(money: enteredMoney))
        }
        popup.addButtons([buttonOne, buttonTwo])
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
