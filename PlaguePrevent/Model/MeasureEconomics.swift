//
//  MeasureEconomics.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension EconomicHelpMeasure {

    func popUp(delegate: ChangeMeasuresDelegate) -> PopupDialog {
        

        let moneyVC = PopupMoneyViewController(nibName: "PopupMoneyViewController", bundle: .main)
        moneyVC.shortTitle = shortTitle()
        moneyVC.longDescription = longDescription()
        moneyVC.image = largeLogo()
        moneyVC.money = self.money
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
            delegate.didChangeEconomics(state: EconomicHelpMeasure.init(money: enteredMoney))
        }
        popup.addButtons([buttonOne, buttonTwo])
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
