//
//  IncomeStatementCard.swift
//  MyBudget
//
//  Created by Johannes on 29.10.19.
//  Copyright © 2019 Johannes Raufeisen. All rights reserved.
//

import UIKit

class PopulationCard: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var moralBarView: BarView!
    @IBOutlet weak var hospitalBarView: BarView!
    @IBOutlet weak var budgetBarView: BarView!
    
    @IBOutlet weak var moralLabel: UILabel!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setMoney(money: Int) {
        guard money >= 1000 else {
            moneyLabel.text = "\(money) €"
            return
        }
        let moneyString = String(money)
        let money = Decimal(money)

        let suffixes = [
            0: "",
            3: "k",
            6: "Mio",
            9: "Mrd",
            12: "Bio",
            15: "Brd",
            18: "Trio",
            21: "Trd",
            24: "Quio",
            27: "Qud"
        ]
        
        var anzahlStellen = 0
        while money > pow(10,anzahlStellen) {
            anzahlStellen += 1
        }

        var potenz = anzahlStellen - 1 // Wir wollen mindestens eine stelle vor dem komma
        var vorneStellen = 1
        while !suffixes.keys.contains(potenz) {
            vorneStellen += 1
            potenz -= 1
        }
        
        var vorneString = moneyString.prefix(vorneStellen)
        if vorneStellen < 3 && moneyString.count > 3 {
            let startIndex = moneyString.index(moneyString.startIndex, offsetBy: vorneStellen)
            let endIndex = moneyString.index(moneyString.startIndex, offsetBy: vorneStellen+(3-vorneStellen))
            vorneString += "." + moneyString[startIndex...endIndex]
        }
        
        
        let formattedMoney = "\(vorneString) \(suffixes[potenz]!) €"
        moneyLabel.text = formattedMoney
    }

    
    private func commonInit() {
        Bundle.main.loadNibNamed("PopulationCard", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds

        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = UIColor.white
        }
        
        moralBarView.fillPercent = 0
        hospitalBarView.fillPercent = 0
        budgetBarView.fillPercent = 0
        
        moralBarView.alwaysFilledDistance = 80
        budgetBarView.alwaysFilledDistance = 80
        hospitalBarView.alwaysFilledDistance = 80
    }

}
