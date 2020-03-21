//
//  MeasureEconomics.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

extension EconomicHelpMeasure {

    func popUp() -> PopupDialog {
        
        let science = EconomicHelpMeasure.init(money: 0)

        let moneyVC = PopupMoneyViewController(nibName: "PopupMoneyViewController", bundle: .main)
        moneyVC.titleLabel.text = science.shortTitle()
        moneyVC.subtitleLabel.text = science.longDescription()
        moneyVC.imageView.image = science.largeLogo()

        
        let popup = PopupDialog(viewController: moneyVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceUp,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        let buttonOne = CancelButton(title: "CANCEL", height: 60) {

        }

        let buttonTwo = DefaultButton(title: "RATE", height: 60) {

        }
        popup.addButtons([buttonOne, buttonTwo])
        
        popup.transitionStyle = .bounceUp
        return popup
    }

    
}
