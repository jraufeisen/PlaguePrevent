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
        let moneyString = String(money)
        let money = Decimal(money)

        let suffixes = [
            3: "k",
            6: "Mio",
            9: "Mrd",
            12: "Bio",
            15: "Brd",
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
        if vorneStellen < 3 {
        //    vorneString
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

class RedesignedPopulationCard: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var moralLabel: UILabel!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var researchLabel: UILabel!
    
    @IBOutlet weak var moralChangeLabel: UILabel!
    @IBOutlet weak var hospitalChangeLabel: UILabel!
    @IBOutlet weak var moneyChangeLabel: UILabel!
    @IBOutlet weak var researchChangeLabel: UILabel!
    
    @IBOutlet weak var moralChangeView: UIView!
    @IBOutlet weak var hospitalChangeView: UIView!
    @IBOutlet weak var moneyChangeView: UIView!
    @IBOutlet weak var researchChangeView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setHealthChange(health: Double) {
        //hospitalChangeView.backgroundColor = health < 0 ? UIColor.red : UIColor.green
        self.hospitalChangeLabel.text = "\(Int(health))"
    }
    
    func setMoralChange(moral: Double) {
        //moralChangeView.backgroundColor = moral < 0 ? UIColor.red : UIColor.green
        self.moralChangeLabel.text = "\(Double(Int(moral*1000))/1000)%"
    }
    
    func setMoneyChange(money: Double) {
        let moneyString = String(money)
        let money = Decimal(money)

        let suffixes = [
            3: "k",
            6: "Mio",
            9: "Mrd",
            12: "Bio",
            15: "Brd",
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
        if vorneStellen < 3 {
        //    vorneString
        }
        
        
        let formattedMoney = "\(vorneString) \(suffixes[potenz]!) €"
        
        //moneyChangeView.backgroundColor = money < 0 ? UIColor.red : UIColor.green
        self.moneyChangeLabel.text = formattedMoney
    }
    
    func setMoney(money: Int) {
        let moneyString = String(money)
        let money = Decimal(money)

        let suffixes = [
            3: "k",
            6: "Mio",
            9: "Mrd",
            12: "Bio",
            15: "Brd",
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
        if vorneStellen < 3 {
        //    vorneString
        }
        
        
        let formattedMoney = "\(vorneString) \(suffixes[potenz]!) €"
        moneyLabel.text = formattedMoney
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("PopulationRedesignedCard", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds

        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = UIColor.white
        }
    }

}

